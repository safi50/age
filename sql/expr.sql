LOAD 'agensgraph';
SET search_path TO ag_catalog;

--
-- map literal
--

-- empty map
SELECT * FROM cypher($$RETURN {}$$) AS r(c agtype);

-- map of scalar values
SELECT * FROM cypher($$
RETURN {s: 's', i: 1, f: 1.0, b: true, z: null}
$$) AS r(c agtype);

--
-- list literal
--

-- empty list
SELECT * FROM cypher($$RETURN []$$) AS r(c agtype);

-- list of scalar values
SELECT * FROM cypher($$RETURN ['str', 1, 1.0, true, null]$$) AS r(c agtype);

--
-- Test transform logic for operators
--
SELECT * FROM cypher(
$$ RETURN (-(3 * 2 - 4.0) ^ ((10 / 5) + 1)) % -3 $$
)
AS r(result agtype);