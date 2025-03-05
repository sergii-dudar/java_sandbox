#include "main2-square.h"

int getSquareSides() // actual definition for getSquareSides
{
    return 4;
}

int getSquarePerimeter( int sideLength ) {
    return sideLength * getSquareSides();
}