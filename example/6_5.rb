def seller?(name)
  name[-1] == 'm'
end

graph = {}
graph['you'] = %w[alice bob claire]
graph['bob'] = %w[anuj peggy]
graph['alice'] = %w[peggy]
graph['claire'] = %w[thom jonny]
graph['anuj'] = []
graph['peggy'] = []
graph['thom'] = []
graph['jonny'] = []

queue = graph['you']
searched = []

until queue.empty?
  person = queue.shift
  if !searched.include?(person)
    if seller?(person)
      puts "#{person} is a mango seller!"
      break
    else
      queue.concat(graph[person])
      searched << person
    end
  end
end