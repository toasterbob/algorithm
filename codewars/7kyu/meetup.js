

function greetDevelopers(list) {
  list.forEach((object) => {
    object.greeting =`Hi ${object.firstName}, what do you like the most about ${object.language}?`
  });
  return list;
}
