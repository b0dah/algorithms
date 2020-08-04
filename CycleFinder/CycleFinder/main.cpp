//
//  main.cpp
//  CycleFinder
//
//  Created by Иван Романов on 25.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

#include <iostream>
#include <vector>

using namespace std;

vector<vector<int>> graph = {
    {1, 3},
    {2},
    {0},
    {}
};

const int n = 4;
vector<bool> visited (n, false);
vector<int> ancestor (n, -1);
vector<int> color (n, 0);

int cycleStart = -1, cycleEnd;

bool dfs(int v) {
    // mark as grey
    color[v] = 1;
    
    // all the neighbours
    for (auto i: graph[v]) {
        // came to white
        if (color[i] == 0) {
            ancestor[i] = v;
            if (dfs(i))
                return true;
        // came to grey = cycle is found
        } else if (color[i] == 1) {
            //printf("%d ", i);
            cycleEnd = v;
            cycleStart = i;
            return true;
        }
    }
    
    color[v] = 2;
    // not a cycle
    return false;
}

int main(int argc, const char * argv[]) {
    
    // start
    for (int i=0;i<n;i++) {
        if (dfs(i))
            break;
    }
    
    // check result
    if (cycleStart == -1) {
        printf("Acyclic \n");
    } else {
        vector<int> cyclePath;
        for (int i=cycleEnd; i!=cycleStart; i=ancestor[i]) {
            cyclePath.push_back(i);
        }
        cyclePath.push_back(cycleStart);
        
        reverse(cyclePath.begin(), cyclePath.end());
        
        printf("Cycle:\n");
        for (auto each: cyclePath)
            printf("%d ", each);
    }
    
    return 0;
}
