package main

import (
	"encoding/json"
	"fmt"
	"os"
)

func main() {
	example1()
	fmt.Print("\n\n")
	example2()
	fmt.Print("\n\n")
	example3()
	fmt.Print("\n\n")
	example4()
	fmt.Print("\n\n")
	example5()
	fmt.Print("\n\n")
	example6()
	fmt.Print("\n\n")
	example7()
}

// --------------------------------------
// https://www.javatpoint.com/go-json

func example1() {
	bolType, _ := json.Marshal(false) // boolean Value
	fmt.Println(string(bolType))
	intType, _ := json.Marshal(10) // integer value
	fmt.Println(string(intType))
	fltType, _ := json.Marshal(3.14) // float value
	fmt.Println(string(fltType))
	strType, _ := json.Marshal("JavaTpoint") // string value
	fmt.Println(string(strType))
	slcA := []string{"sun", "moon", "star"} // slice value
	slcB, _ := json.Marshal(slcA)
	fmt.Println(string(slcB))
	mapA := map[string]int{"sun": 1, "moon": 2} // map value
	mapB, _ := json.Marshal(mapA)
	fmt.Println(string(mapB))
}

// --------------------------------------Structs

func example2() {
	fmt.Printf(">>>Example2: \n")
	res1A := &Response1{
		Position: 1,
		Planet:   []string{"mercury", "venus", "earth"},
	}
	res1B, _ := json.Marshal(res1A)
	fmt.Println(string(res1B))

	res2D := &Response2{
		Position: 1,
		Planet:   []string{"mercury", "venus", "earth"},
	}
	res2B, _ := json.Marshal(res2D)
	fmt.Println(string(res2B))

	byt := []byte(`{"pi":6.13,"place":["New York","New Delhi"]}`)
	var dat map[string]interface{}
	if err := json.Unmarshal(byt, &dat); err != nil {
		panic(err)
	}
	fmt.Println(dat)
	num := dat["pi"].(float64)
	fmt.Println(num)
	strs := dat["place"].([]interface{})
	str1 := strs[0].(string)
	fmt.Println(str1)

	str := `{"Position": 1, "Planet": ["mercury", "venus"]}`
	res := Response2{}
	json.Unmarshal([]byte(str), &res)
	fmt.Println(res)
	fmt.Println(res.Planet[1])
	enc := json.NewEncoder(os.Stdout)
	d := map[string]string{"1": "mercury", "2": "venus"}
	enc.Encode(d)
}

type Response1 struct {
	Position int
	Planet   []string
}
type Response2 struct {
	Position int      `json:"position"`
	Planet   []string `json:"planet"`
}

// --------------------------------------

func example3() {
	fmt.Printf(">>>Example3: \n")
}

// --------------------------------------

func example4() {
	fmt.Printf(">>>Example4: \n")
}

// --------------------------------------

func example5() {
	fmt.Printf(">>>Example5: \n")
}

// --------------------------------------

func example6() {
	fmt.Printf(">>>Example6: \n")
}

// --------------------------------------

func example7() {
	fmt.Printf(">>>Example7: \n")
}
