/* 1. Consulta SQL para listar o nome de todos os alunos matriculados na disciplina de Cálculo do professor João. */
SELECT a.nome
FROM aluno a
    JOIN cursa c ON a.coda = c.coda
    JOIN leciona l ON c.codd = l.codd
    JOIN professor p ON p.codp = l.codp
    JOIN disciplina d ON l.codd = l.codd
WHERE d.nome = 'Cálculo' AND p.nome = 'João';

/* 2. Consulta SQL para exibir a quantidade de alunos por disciplinas. */
SELECT COUNT(*) as quantidadeAlunos, disciplina.nome as disciplina
FROM disciplina
    LEFT JOIN cursa ON disciplina.codd = cursa.codd
    LEFT JOIN aluno ON cursa.coda = aluno.coda
GROUP BY disciplina.nome;

/* 3. Consulta SQL para listar as disciplinas que todos os professores lecionam. */
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

/* 4. Consulta SQL que exibe o total de professores. */
SELECT COUNT(DISTINCT PROFESSOR.codp) as total_professor
FROM PROFESSOR;

/* 5. Consulta SQL para listar todos os alunos que cursaram alguma disciplina do ano 2000 até 2020. */
SELECT DISTINCT aluno.nome
FROM ALUNO
    JOIN CURSA ON aluno.cod = cursa.coda
    JOIN DISCIPLINA ON cursa.codd = DISCIPLINA.cod
WHERE YEAR(CURSA.ano) BETWEEN 2000 AND 2020;