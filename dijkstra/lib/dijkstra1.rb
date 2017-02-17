require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source)
  shortest_paths = {}
  possible_paths = { source => {cost: 0, previous_edge: nil } }

  until possible_paths.empty?
    vertex, data = possible_paths.min_by do |(vertex, data)|
      data[:cost]
    end
    shortest_paths[vertex] = possible_paths[vertex]
    possible_paths.delete(vertex)

    path_cost = shortest_paths[vertex][:cost]

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex

      new_path_cost = path_cost + edge.cost

      if possible_paths[to_vertex].nil? || possible_paths[to_vertex][:cost] > new_path_cost
        possible_paths[to_vertex] = { cost: new_path_cost, last_edge: edge }
      end
    end

  end

  shortest_paths
end
