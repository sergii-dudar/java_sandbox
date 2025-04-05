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
        final String title = "yellowjackets.s03";

        // for serials
        outDir = String.format("%s/%s/", outDir, title);
        final List<Entry<String, String>> nameToUrlTmplList = List.of(
                // entry("https://zetvideo.net/content/stream/serials/invincible._s02e08._i_thought_you_were_stronger_11650/hls/1080/segment%s.ts"),

                entry(title + "e01",
                        "https://zetvideo.net/content/stream/serials/yellowjackets/s03/yellowjackets.s03e01.1080p.webdlrip.x264.aac.uaflix_11985/hls/1080/segment%s.ts"),
                entry(title + "e02",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e02.1080p.webdlrip.x264.aac.uaflix_12012/hls/1080/segment%s.ts"),
                entry(title + "e03",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e03.1080p.webdlrip.x264.aac.uaflix_12260/hls/1080/segment%s.ts"),
                entry(title + "e04",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e04.1080p.webdlrip.x264.aac.uaflix_12387/hls/1080/segment%s.ts"),
                entry(title + "e05",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e05.1080p.webdlrip.x264.aac.uaflix_12538/hls/1080/segment%s.ts"),
                entry(title + "e06",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e06.1080p.webdlrip.x264.aac.uaflix_12781/hls/1080/segment%s.ts"),
                entry(title + "e07",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e07.1080p.webrip.x264.aac.uaflix_13056/hls/1080/segment%s.ts"),
                entry(title + "e08",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e08.1080p.webrip.x264.aac.uaflix_13377/hls/1080/segment%s.ts"),
                entry(title + "e09",
                        "https://zetvideo.net/content/stream/serials/yellowjackets.s03e09.1080p.webrip.x264.aac.uaflix_13699/hls/1080/segment%s.ts")

        // entry(title + ".s03e08",
        // "https://zetvideo.net/content/stream/serials/invincible.2021.s03e08.1080p.webdlrip.x264.aac.uaflix_12722/hls/1080/segment%s.ts"),
        // entry("https://zetvideo.net/content/stream/serials/invincible._s02e08._i_thought_you_were_stronger_11650/hls/1080/segment%s.ts")
        );

        int startNumber = 1;

        if (!Files.exists(Path.of(outDir))) {
            Files.createDirectory(Path.of(outDir));
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
