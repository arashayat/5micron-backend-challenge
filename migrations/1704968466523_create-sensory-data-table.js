exports.up = (pgm) => {
    pgm.createTable("sensory_data", {
        id: "id",
        serial: { type: "string", notNull: true },
        swVersion: { type: "string", notNull: true },
        temperature: { type: "float", notNull: true },
        date: { type: "timestamptz", notNull: true },
        gps: { type: "point", notNull: true },
      });
  };
  
  exports.down = (pgm) => {
    pgm.dropTable('sensory_data');
  };