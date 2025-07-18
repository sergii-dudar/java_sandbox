import java.io.*;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class TsLoaderRun {

    public static void main(String[] args) throws IOException {

        String outDir = "/home/serhii/serhii.home/videos/";
        final String title = "squid-game-s3";

        // for serials
        outDir = String.format("%s%s/", outDir, title);

        final List<Entry<String, String>> nameToUrlTmplList = List.of(
                // entry("https://zetvideo.net/content/stream/serials/invincible._s02e08._i_thought_you_were_stronger_11650/hls/1080/segment%s.ts"),

                // entry(title + "e01",
                // "https://wqueuqwue13.boogiemovie.online/hls/348/3/1/10332_m/1080.mp4/seg-%s-v1-a1.ts"),
                entry(title + "e02",
                        "https://wqueuqwue12.boogiemovie.online/hls/348/3/2/10333_m/1080.mp4/seg-%s-v1-a1.ts"),
                entry(title + "e03",
                        "https://wqueuqwue12.boogiemovie.online/hls/348/3/3/10338_m/1080.mp4/seg-%s-v1-a1.ts"),
                entry(title + "e04",
                        "https://wqueuqwue12.boogiemovie.online/hls/348/3/4/10339_m/1080.mp4/seg-%s-v1-a1.ts"),
                entry(title + "e05",
                        "https://wqueuqwue13.boogiemovie.online/hls/348/3/5/10340_m/1080.mp4/seg-%s-v1-a1.ts"),
                entry(title + "e06",
                        "https://wqueuqwue12.boogiemovie.online/hls/348/3/6/10341_m/1080.mp4/seg-%s-v1-a1.ts")
        // entry(title + "",
        // ""),
        // entry(title + "",
        // "")
        // entry(title + "",
        // ""),
        // entry(title + "e08",
        // ""),
        // entry(title + "e09",
        // ""),
        // entry(title + "e10",
        // "")

        // entry(title + ".s03e08",
        // "https://zetvideo.net/content/stream/serials/invincible.2021.s03e08.1080p.webdlrip.x264.aac.uaflix_12722/hls/1080/segment%s.ts"),
        // entry("https://zetvideo.net/content/stream/serials/invincible._s02e08._i_thought_you_were_stronger_11650/hls/1080/segment%s.ts")
        );

        int startNumber = 1;

        if (!Files.exists(Path.of(outDir))) {
            // Files.createDirectory(Path.of(outDir));
            Files.createDirectories(Path.of(outDir));
        }

        final String outDirRes = outDir;
        nameToUrlTmplList.forEach(entry -> {
            String name = entry.getKey();
            final String urlTmpl = entry.getValue();

            if (name == null || name.trim().length() == 0) {
                final String[] parts = urlTmpl.split("/");
                name = parts[parts.length - 4];
            }

            final String outFile = outDirRes + name + ".ser.mp4";
            System.out.println(ofPurple(outFile) + ofYellow(" started"));
            try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(outFile, true))) {
                for (int i = startNumber;; i++) {
                    String url = String.format(urlTmpl, i);
                    // String utl = urlTmpl + i + ".ts";
                    try {
                        System.out.println(ofGreen("Trying to load `") +
                                ofCyan(name) + ofGreen("` by: ") + ofBlue(url));

                        try (BufferedInputStream in = new BufferedInputStream(URI.create(url).toURL().openStream())) {
                            byte[] bytes = in.readAllBytes();
                            outputStream.write(bytes);
                        } catch (FileNotFoundException ex) {
                            System.out.println(ofYellow("finished"));
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

    private static Entry<String, String> entry(String name, String url) {
        return Map.entry(name, url);
    }

    private static Entry<String, String> entry(String url) {
        return entry("", url);
    }

    private static String ofGreen(String str) {
        return ofColor(str, GREEN_BOLD_BRIGHT);
    }

    private static String ofCyan(String str) {
        return ofColor(str, CYAN_BOLD_BRIGHT);
    }

    private static String ofBlue(String str) {
        return ofColor(str, BLUE_BOLD_BRIGHT);
    }

    private static String ofYellow(String str) {
        return ofColor(str, YELLOW_BOLD_BRIGHT);
    }

    private static String ofPurple(String str) {
        return ofColor(str, PURPLE_BOLD_BRIGHT);
    }

    private static String ofColor(String str, String color) {
        return color + str + RESET;
    }

    // Reset
    public static final String RESET = "\033[0m"; // Text Reset

    public static final String GREEN_BOLD_BRIGHT = "\033[1;92m"; // GREEN
    public static final String YELLOW_BOLD_BRIGHT = "\033[1;93m";// YELLOW
    public static final String BLUE_BOLD_BRIGHT = "\033[1;94m"; // BLUE
    public static final String PURPLE_BOLD_BRIGHT = "\033[1;95m";// PURPLE
    public static final String CYAN_BOLD_BRIGHT = "\033[1;96m"; // CYAN
}
