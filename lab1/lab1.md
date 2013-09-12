# TDDD43, Lab 1

## Part 1


## Part 2

### Task 1

#### 1a)
``
SELECT expert.name FROM expertArea, expert
WHERE expertArea.id = expert.id AND expertArea.id = 2
``
> Holger Grenquist

#### 1b)
``
SELECT child.description FROM ExpertArea AS child, ExpertArea AS parent
WHERE child.parent = parent.id AND parent.id = 1
``
> Databases
> Programming

#### 1c)
``
SELECT expert.name FROM recommendation, expert, expertise
WHERE expert.id = recommendation.recommendedExpert
AND expert.id = expertise.expert
AND expertise.expertArea = 3
AND recommendation.authorExpert = 2
``
> Niclas Olofsson

#### 1d)
``
SELECT expert.name FROM recommendation AS r1, recommendation AS r2, expert, expertise
WHERE expert.id = expertise.expert
AND expert.id = r2.recommendedExpert
AND r1.recommendedExpert = r2.authorExpert
AND expertise.expertArea = 3
AND r1.authorExpert = 3
``
> Niclas Olofsson

#### 1e)
Not possible (at least not without recursive non-standard stuff)
