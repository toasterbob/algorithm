require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms
#Kahn's
#O(|V| + |E|)
def topological_sort(vertices)
  queue = []
  sorted = []
  in_edge_counts = {}

  vertices.each do |vertice|
    in_edge_counts[vertice] = vertice.in_edges.count
    queue << vertice if vertice.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.shift
    sorted << vertex

    vertex.out_edges.each do |edge|
      to_vertex = edge.to_vertex

      in_edge_counts[to_vertex] -= 1
      queue << to_vertex if in_edge_counts[to_vertex] == 0
    end

  end

  sorted

end

#Tarjans 
def topological_sort_tarjans(vertices)
  ordering = []
    explored = Set.new

    vertices.each do |vertex| # O(|v|)
      dfs!(vertex, explored, ordering) unless explored.include?(vertex)
    end

    ordering
  end

  def dfs!(vertex, explored, ordering)
    explored.add(vertex)

    vertex.out_edges.each do |edge| # O(|e|)
      new_vertex = edge.to_vertex
      dfs!(new_vertex, explored, ordering) unless explored.include?(new_vertex)
    end

    ordering.unshift(vertex)
  end
