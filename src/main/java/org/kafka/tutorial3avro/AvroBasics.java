package org.kafka.tutorial3avro;

public class AvroBasics {
/*    private final static MediaType SCHEMA_CONTENT =
        MediaType.parse("application/vnd.schemaregistry.v1+json");

    private final static String EMPLOYEE_SCHEMA = "{\n" +
        "  \"schema\": \"" +
        "  {" +
        "    \\\"namespace\\\": \\\"com.cloudurable.phonebook\\\"," +
        "    \\\"type\\\": \\\"record\\\"," +
        "    \\\"name\\\": \\\"Employee\\\"," +
        "    \\\"fields\\\": [" +
        "        {\\\"name\\\": \\\"fName\\\", \\\"type\\\": \\\"string\\\"}," +
        "        {\\\"name\\\": \\\"lName\\\", \\\"type\\\": \\\"string\\\"}," +
        "        {\\\"name\\\": \\\"age\\\",  \\\"type\\\": \\\"int\\\"}," +
        "        {\\\"name\\\": \\\"phoneNumber\\\",  \\\"type\\\": \\\"string\\\"}" +
        "    ]" +
        "  }\"" +
        "}";

    public static void main(String[] args) {
        //File file = new File("employees.avro");
        //saveToFile(file);
        //readFromFile(file);

        avroRegistry();
    }

    @SneakyThrows
    private static void avroRegistry() {
        System.out.println(EMPLOYEE_SCHEMA);

        final OkHttpClient client = new OkHttpClient();

        //POST A NEW SCHEMA
        Request request = new Request.Builder()
            .post(RequestBody.create(SCHEMA_CONTENT, EMPLOYEE_SCHEMA))
            .url("http://localhost:8081/subjects/Employee/versions")
            .build();

        String output = client.newCall(request).execute().body().string();
        System.out.println(output);

        //LIST ALL SCHEMAS
        request = new Request.Builder()
            .url("http://localhost:8081/subjects")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);


        //SHOW ALL VERSIONS OF EMPLOYEE
        request = new Request.Builder()
            .url("http://localhost:8081/subjects/Employee/versions/")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);

        //SHOW VERSION 2 OF EMPLOYEE
        request = new Request.Builder()
            .url("http://localhost:8081/subjects/Employee/versions/2")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);

        //SHOW THE SCHEMA WITH ID 3
        request = new Request.Builder()
            .url("http://localhost:8081/schemas/ids/3")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);


        //SHOW THE LATEST VERSION OF EMPLOYEE 2
        request = new Request.Builder()
            .url("http://localhost:8081/subjects/Employee/versions/latest")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);



        //CHECK IF SCHEMA IS REGISTERED
        request = new Request.Builder()
            .post(RequestBody.create(SCHEMA_CONTENT, EMPLOYEE_SCHEMA))
            .url("http://localhost:8081/subjects/Employee")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);


        //TEST COMPATIBILITY
        request = new Request.Builder()
            .post(RequestBody.create(SCHEMA_CONTENT, EMPLOYEE_SCHEMA))
            .url("http://localhost:8081/compatibility/subjects/Employee/versions/latest")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);

        // TOP LEVEL CONFIG
        request = new Request.Builder()
            .url("http://localhost:8081/config")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);


        // SET TOP LEVEL CONFIG
        // VALUES are none, backward, forward and full
        request = new Request.Builder()
            .put(RequestBody.create(SCHEMA_CONTENT, "{\"compatibility\": \"none\"}"))
            .url("http://localhost:8081/config")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);

        // SET CONFIG FOR EMPLOYEE
        // VALUES are none, backward, forward and full
        request = new Request.Builder()
            .put(RequestBody.create(SCHEMA_CONTENT, "{\"compatibility\": \"backward\"}"))
            .url("http://localhost:8081/config/Employee")
            .build();

        output = client.newCall(request).execute().body().string();
        System.out.println(output);
        System.out.println();
    }

    @SneakyThrows
    private static void readFromFile(File file) {
        final List<EmployeeTest> employeeList = new ArrayList<>();
        final DatumReader<EmployeeTest> empReader = new SpecificDatumReader<>(EmployeeTest.class);
        final DataFileReader<EmployeeTest> dataFileReader = new DataFileReader<>(file, empReader);

        while (dataFileReader.hasNext()) {
            employeeList.add(dataFileReader.next(new EmployeeTest()));
        }
        System.out.println();
    }

    @SneakyThrows
    private static void saveToFile(File file) {
        final List<EmployeeTest> employeeList = generateEmployers();
        final DatumWriter<EmployeeTest> datumWriter = new SpecificDatumWriter<>(EmployeeTest.class);

        try (DataFileWriter<EmployeeTest> dataFileWriter = new DataFileWriter<>(datumWriter)) {
            dataFileWriter.create(employeeList.get(0).getSchema(), file);
            for (EmployeeTest employee : employeeList) {
                dataFileWriter.append(employee);
            }
        }
    }

    private static List<EmployeeTest> generateEmployers() {
        AtomicInteger integer = new AtomicInteger();
        return Stream.generate(() -> EmployeeTest.newBuilder().setAge(35 + integer.incrementAndGet())
            .setFirstName("Bob" + integer.get())
            .setLastName("Jones" + integer.get())
            .setPhoneNumber("555-555-1212" + integer.get())
            .build())
            .limit(3)
            .collect(Collectors.toList());
    }*/
}
