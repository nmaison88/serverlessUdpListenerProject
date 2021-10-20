
module.exports.handler = async (event) => {
  if (event.Records && event.Records.length > 0) {
    const { Records } = event;
    Records.forEach((record) => {
      console.log(record);
    });
  }
  return {};
};
