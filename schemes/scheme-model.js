const db = require("../data/db-config");

module.exports = {
	find,
	findById,
	findSteps,
	add,
	addStep,
	update,
	remove
};

function find() {
	return db("Schemes");
}

function findById(id) {
	return db("Schemes").where({ id });
}

function findSteps(id) {
	return db("steps")
		.select(
			"schemes.id",
			"schemes.scheme_name",
			"steps.step_number",
			"steps.instructions"
		)
		.join("schemes", "steps.scheme_id", "=", "schemes.id")
		.where({ scheme_id: id })
		.orderBy("steps.step_number");
}

function add(scheme) {
	return db("schemes").insert(scheme);
}

function addStep(step, scheme_id) {
	return db("steps")
		.insert({ ...step, scheme_id })
		.then(id => {
			return db("steps")
				.where({ id: id[0] })
				.first();
		});
}

function update(changes, id) {
	return db("schemes")
		.where({ id })
		.update(changes);
}

function remove(id) {
	return db("schemes")
		.where({ id })
		.del();
}
