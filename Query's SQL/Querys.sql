/* 1 */
SELECT a.nome
FROM aluno a
    JOIN cursa c ON a.coda = c.coda
    JOIN leciona l ON c.codd = l.codd
    JOIN professor p ON p.codp = l.codp
    JOIN disciplina d ON l.codd = l.codd
WHERE d.nome = 'Cálculo' AND p.nome = 'João';

/* 2 */
SELECT COUNT(*) as quantidadeAlunos, disciplina.nome as disciplina
FROM disciplina
    LEFT JOIN cursa ON disciplina.codd = cursa.codd
    LEFT JOIN aluno ON cursa.coda = aluno.coda
GROUP BY disciplina.nome;

/* 3 */
SELECT d.nome
FROM disciplina d
WHERE
    NOT EXISTS(SELECT p.codp
        FROM professor p
        WHERE
            NOT EXISTS(SELECT l.codd
                FROM leciona l
                WHERE l.codd = d.codd AND l.codp = p.codp
                )
            );

/* 4 */
SELECT COUNT(DISTINCT PROFESSOR.codp) as total_professor
FROM PROFESSOR;

/* 5 */
SELECT DISTINCT aluno.nome
FROM ALUNO
    JOIN CURSA ON aluno.cod = cursa.coda
    JOIN DISCIPLINA ON cursa.codd = DISCIPLINA.cod
WHERE YEAR(CURSA.ano) BETWEEN 2000 AND 2020;