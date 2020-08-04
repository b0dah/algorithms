//
//  main.cpp
//  dfs
//
//  Created by Иван Романов on 21.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

#include <iostream>
#include <vector>
#include <queue>

using namespace std;

vector <vector <int>> graph = {
//    {1,2,3},
//    {0,2},
//    {0,1},
//    {0}
    {1,6,7},
    {0, 2},
    {3,4},
    {2,5},
    {2},
    {4},
    {7},
    {6}
};

const int numberOfVertexes = 8;
vector<char> visited(numberOfVertexes, false);

void dfs(int v) {
    printf("%d ", v);
    visited[v] = true;
    
    // all the neighbours
    for (auto i: graph[v])
        if (!visited[i]) {
            dfs(i);
        }
}

void bfs(int start) {
    printf("\n");
    queue<int> queue;
    vector<bool> visited(numberOfVertexes, false);
    
    
    queue.push(start);
    visited[start] = true;
    
    while (!queue.empty()) {
        // 1st vertex in the stack
        int current = queue.front();
        queue.pop();
     
        printf("%d ", current);
        
        // traverse all the neighbours
        for (auto i: graph[current]) {
            if (!visited[i]) {
                visited[i] = true;
                queue.push(i);
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    dfs(0);
    
    bfs(0);


    return 0;
}

// How does iterator work
//vector<int> a = {8,8,8,8};
//vector<int>::iterator i;
//for (i = a.begin(); i<a.end(); i++) {
//    printf("%d ", *i);
//}

