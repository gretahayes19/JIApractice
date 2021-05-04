export const fetchTeas = () => {
  return $.ajax({
    url: `/api/teas`,
    method: `get`,
  });
};

export const createTea = (tea) => {
  return $.ajax({
    url: `/api/teas`,
    method: `post`,
    data: {
      tea: tea,
    },
  });
};