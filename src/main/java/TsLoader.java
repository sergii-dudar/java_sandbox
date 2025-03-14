import java.io.*;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import static java.lang.String.format;

public class TsLoader {

    public static void main(String[] args) throws IOException {

        List<String> urlTmpls = List.of(

                "https://zetvideo.net/content/stream/serials/invincible._s02e08._i_thought_you_were_stronger_11650/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e01.1080p.webdlrip.x264.aac.uaflix_11629/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e02.1080p.webdlrip.x264.aac.uaflix_11632/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e03.1080p.webdlrip.x264.aac.uaflix_11633/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e04.1080p.webdlrip.x264.aac.uaflix_11922/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible/s03/invincible.2021.s03e05.1080p.webdlrip.x264.aac.uaflix_12169/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e06.1080p.webdlrip.x264.aac.uaflix_12362/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e07.1080p.webdlrip.x264.aac.uaflix_12513/hls/1080/segment%s.ts",
                "https://zetvideo.net/content/stream/serials/invincible.2021.s03e08.1080p.webdlrip.x264.aac.uaflix_12722/hls/1080/segment%s.ts"

        );

        int startNumber = 1;

        // final String outDir =
        // "/run/media/serhii/1AB5DE9C5C1D3329/Mayor-of-Kingstown-s3/";
        // final String outDir = "/home/serhii/serhii.home/videos/";
        final String outDir = "/home/serhii/serhii.home/videos/invincible.s03/";

        if (!Files.exists(Path.of(outDir))) {
            Files.createDirectory(Path.of(outDir));
        }

        urlTmpls.forEach(urlTmpl -> {
            String[] parts = urlTmpl.split("/");
            final String outFileName = parts[parts.length - 4];
            final String outFile = outDir + outFileName + "ser.mp4";
            System.out.println(outFile);
            try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(outFile, true))) {
                for (int i = startNumber;; i++) {
                    String utl = format(urlTmpl, i);
                    // String utl = urlTmpl + i + ".ts";
                    try {
                        System.out.println("trying to load: " + utl);

                        try (BufferedInputStream in = new BufferedInputStream(URI.create(utl).toURL().openStream())) {
                            byte[] bytes = in.readAllBytes();
                            outputStream.write(bytes);
                        } catch (FileNotFoundException ex) {
                            System.out.println("finished");
                            break;
                        }
                    } catch (Throwable ex) {
                        System.err.println(ex);
                    }
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
        System.out.println();
    }
}