//
//  main.cpp
//  CppPointersAndDynamicMemory
//
//  Created by Иван Романов on 20.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

#include <iostream>

//Указатель - переменная, значением котррой является ячейка памяти
//Ссылка - тип переменной, который работает как псевдоним другого объекта или значения

int main(int argc, const char * argv[]) {
    
    // some int var
    int someInt = 100;
    double someDouble = 100.0;
    
    // MARK:- Pointers:
    int *ptr = &someInt;
    double *pointerToDouble = &someDouble;
    
    // MARK:- References
    int &ref = someInt;
    double &reference = someDouble;
    
    // MARK:- Dynamic memory allocation
    int* pointer = new int(100);
    *pointer = 8;
    
    std::cout << "Pointer address value: " << pointer << std::endl;
    std::cout << "Pointer value: " << *pointer << std::endl;
    
    delete pointer;
    
    /// Arrays:
    int *arrayPointer = new int[10];
    
    int length = 100;
    int *longArrayPointer = new int[length];
    
    int *zeroArrayPointer = new int[5]();
    int *nonZeroArrayPointer = new int[] {1,2,33,4,4};
    
    //1
    nonZeroArrayPointer++;
    printf("%d \n", *nonZeroArrayPointer);
    
    //2
    nonZeroArrayPointer--;
    printf("%d \n", *nonZeroArrayPointer);
    
    int *nonZeroArrayPointerCopy = nonZeroArrayPointer; // присваивание
    nonZeroArrayPointerCopy+=4;
    
    // 3
    printf("%d \n", nonZeroArrayPointerCopy - nonZeroArrayPointer);

    return 0;
}
