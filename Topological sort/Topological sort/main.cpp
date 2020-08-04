
//Задача топологической сортировки графа состоит в следующем: указать такой линейный порядок на его вершинах, чтобы любое ребро вело от вершины с меньшим номером к вершине с большим номером.

#include <iostream>
#include <vector>

using namespace std;

const int n = 4;

vector <vector<int>> graph = {
    {3 },
    {},
    {1},
    {1,2},
};

vector<bool> visited (n, false);
vector<int> answer;


void printVector(vector<int> a) {
    cout << endl;
    for (auto each: a) {
        printf("%d ", each);
    }
    cout << endl;
}


void dfs(int v) {
    visited[v] = true;
    
    for (auto i: graph[v]) {
        if (!visited[i])
            dfs(i);
    }
    
    answer.push_back(v);
}

void topologicalSort() {
//    for (int i=0; i<n; i++) {
//        if (!visited[i]) {
//            dfs(i);
//        }
//    }
    dfs(0);
    reverse(answer.begin(), answer.end());
}



int main(int argc, const char * argv[]) {
    
    topologicalSort();
    printVector(answer);
    
    return 0;
}
