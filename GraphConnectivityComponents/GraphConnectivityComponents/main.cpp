//
//  main.cpp
//  GraphConnectivityComponents
//
//  Created by Иван Романов on 25.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

#include <iostream>
#include <vector>

using namespace std;

vector<vector<int>> graph = {
    {1},
    {0},
    {4},
    {4},
    {2,3}
};
const int n = 5;
vector<bool> visited (n, false);
vector<int> currentComponent;

void dfs(int v) {
    visited[v] = true;
    currentComponent.push_back(v);
    
    for (auto i: graph[v]) {
        if (!visited[i]) {
            dfs(i);
        }
    }
}

void findComponents() {
    
    for (int i=0; i<n; i++) {
        if (!visited[i]) {
            // new component
            currentComponent.clear();
            
            dfs(i);
            
            // прошли все, что можно в dfs.
            printf("Component: \n");
            for (auto i: currentComponent) {
                printf("%d ", i);
            }
            cout << endl;
        }
    }
}

int main(int argc, const char * argv[]) {
   
    findComponents();
    
    return 0;
}
