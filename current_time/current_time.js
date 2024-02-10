exports.handler = async (event, context) => {
  const currentTime = new Date().toLocaleString();

  const response = {
    statusCode: 200,
    headers: {
      "Content-Type": "text/plain",
    },
    body: currentTime,
  };

  return response;
};
