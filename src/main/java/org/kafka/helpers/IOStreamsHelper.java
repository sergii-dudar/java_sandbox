package org.kafka.helpers;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import static java.nio.charset.StandardCharsets.UTF_8;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class IOStreamsHelper {
    public static String toStringUTF8(InputStream inputStream) {
        try (BufferedReader br = new BufferedReader(new InputStreamReader(inputStream, UTF_8))) {
            return br.lines().collect(Collectors.joining(System.lineSeparator()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String unzipFirst(InputStream zipInputStream) {
        try (ZipInputStream zis = new ZipInputStream(zipInputStream)) {
            ZipEntry zipEntry = zis.getNextEntry();
            if (zipEntry != null) {
                return new String(zis.readAllBytes(), UTF_8);
            }
            throw new RuntimeException("zip file is empty");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String readFileFromResources(String resourcePath) {
        return readFileFromResources(resourcePath, IOStreamsHelper.class);
    }

    public static String readFileFromResources(String resourcePath, Class<?> clazz) {
        try (InputStream in = clazz.getResourceAsStream(resourcePath)) {
            return toStringUTF8(in);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static Stream<List<String>> readCsvContent(String content, String delimiter) {
        BufferedReader br = new BufferedReader(new StringReader(content));
        return StreamSupport.stream(SimpleSpliterator.from(() -> {
            String line = Unchecked.supplier(br::readLine);
            return Objects.isNull(line) ? null : Arrays.asList(line.split(delimiter));
        }, () -> Unchecked.runnable(br::close)), false);
    }

    public static void write(String filePath, byte[] content) {
        write(Paths.get(filePath), content);
    }

    public static void write(Path path, byte[] content) {
        Unchecked.runnable(() -> Files.write(path, content));
    }

    public static byte[] read(String filePath) {
        return read(Paths.get(filePath));
    }

    public static byte[] read(Path path) {
        if (!Files.exists(path)) {
            return null;
        }

        return Unchecked.supplier(() -> Files.readAllBytes(path));
    }

    public static void append(String path, String content, String... separator) {
        Unchecked.runnable(() -> {
            try (FileWriter fw = new FileWriter(path, true)) {
                fw.write(content);
                if (separator.length > 0) {
                    fw.write(separator[0]);
                }
            }
        });
    }

    public static String readLine(String path) {
        if (!new File(path).exists()) {
            return null;
        }

        return Unchecked.supplier(() -> {
            try (BufferedReader buff = new BufferedReader(new FileReader(path))) {
                return buff.readLine();
            }
        });
    }

    public static void removeLine(String path) {
        File file = new File(path);
        if (!file.exists()) {
            return;
        }

        Unchecked.runnable(() -> {
            File tmpFile = File.createTempFile(UUID.randomUUID().toString(), ".tmp");
            try (BufferedWriter tmpFileBw = new BufferedWriter(new FileWriter(tmpFile, true))) {
                try (BufferedReader buff = new BufferedReader(new FileReader(file))) {
                    buff.readLine(); //skip

                    String currentLine;
                    while ((currentLine = buff.readLine()) != null) {
                        tmpFileBw.write(currentLine);
                        tmpFileBw.newLine();
                    }
                }
            }
            Files.write(file.toPath(), Files.readAllBytes(tmpFile.toPath()));
        });
    }

    public static String readString(Path path) {
        if (!Files.exists(path)) {
            return null;
        }

        return Unchecked.supplier(() -> Files.readString(path));
    }

    public static String readString(String path) {
        return readString(Path.of(path));
    }

    public static void writeString(Path path, String content) {
        Unchecked.runnable(() -> Files.write(path, content.getBytes(UTF_8)));
    }

    public static void writeString(String path, String content) {
        writeString(Path.of(path), content);
    }

    public static <T extends AutoCloseable> T closeIO(T uncontrolledSource) {
        try (uncontrolledSource) {
            return uncontrolledSource;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
