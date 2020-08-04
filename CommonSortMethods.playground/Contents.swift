import UIKit

func swap(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var a = 0, b = 1
swap(&a, &b)
print(a, b)

func bubbleSort(a: inout [Int]) {
    for i in 1...a.count - 1 {
        for j in 0...a.count - i - 1 {
            if a[j]>a[j+1] {
                a.swapAt(j, j+1)
            }
        }
    }
}

func shuttleSort(a: inout [Int]) {
    for i in 1...a.count - 1 {
        if a[i] < a[i-1] {
            a.swapAt(i, i-1)
            for k in stride(from: i-1, through: 1, by: -1) {
                if a[k] < a[k-1] {
                    a.swapAt(k, k-1)
                } else { break }
            }
        }
    }
}

/// Bubble alternative
func selectionSort(a: inout [Int]) {
    for i in 0...a.count-2 {
        var minIndex = i
        
        for j in i+1...a.count-1 {
            if a[j] < a[minIndex] {
                minIndex = j
            }
        }
        
        a.swapAt(minIndex, i)
    }
}

// MARK:- QuickSort
func partition(a: inout [Int], l: Int, r: Int) -> Int {
    let base = a[(l+r)/2]
    
    var i = l, j = r
    
    while (i <= j) {
        while a[i] < base {
            i+=1
        }
        
        while a[j] > base {
            j-=1
        }
        
        if i >= j {
            break
        }
        
        a.swapAt(i, j)
        
        i += 1
        j -= 1
    }
    
    return j
}

func quickSort(a: inout [Int], l: Int, r: Int) {
    if l<r {
        let baseIndex = partition(a: &a, l: l, r: r)
        quickSort(a: &a, l: l, r: baseIndex)
        quickSort(a: &a, l: baseIndex+1, r: r)
    }
}


var array = [5,4,1,2]
//selectionSort(a: &array)
quickSort(a: &array, l: 0, r: array.count-1)
print(array)
