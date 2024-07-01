# <version>3.2.6</version>
# <spring-cloud.version>4.0.6</spring-cloud.version>

#find
find . -name "pom.xml" | while read -r file; do
  awk -v file="$file" '/<artifactId>spring-boot-starter-parent<\/artifactId>/ {found_artifact=1}
     /<version>.*<\/version>/ {if (found_artifact) print file ":", $0; found_artifact=0}' "$file"
done


#replace
find . -name "pom.xml" | while read -r file; do
  awk '/<artifactId>spring-boot-starter-parent<\/artifactId>/ {found_artifact=1}
       found_artifact && /<version>.*<\/version>/ {sub(/<version>.*<\/version>/, "<version>3.2.6</version>"); found_artifact=0}
       {print}' "$file" > temp.xml && mv temp.xml "$file"
done
