-- =========================================================
-- PROJETO: Análise de Turnover de RH
-- Desenvolvido por: Amanda Braga
-- Ferramentas: MySQL + Power BI + DAX
-- Dataset: IBM HR Analytics Employee Attrition
-- =========================================================

-- =========================================================
-- 1. Total de Funcionários
-- =========================================================

SELECT COUNT(*) AS total_funcionarios
FROM funcionarios;

-- =========================================================
-- 2. Total de Desligamentos
-- =========================================================

SELECT COUNT(*) AS total_desligamentos
FROM funcionarios
WHERE Attrition = 'Yes';

-- =========================================================
-- 3. Turnover Geral (%)
-- =========================================================

SELECT
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS turnover_percentual
FROM funcionarios;

-- =========================================================
-- 4. Funcionários por Departamento
-- =========================================================

SELECT
Department,
COUNT(*) AS total
FROM funcionarios
GROUP BY Department
ORDER BY total DESC;

-- =========================================================
-- 5. Desligamentos por Departamento
-- =========================================================

SELECT
Department,
Attrition,
COUNT(*) AS quantidade
FROM funcionarios
GROUP BY Department, Attrition
ORDER BY Department;

-- =========================================================
-- 6. Turnover por Departamento
-- =========================================================

SELECT
Department,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS turnover_percentual
FROM funcionarios
GROUP BY Department
ORDER BY turnover_percentual DESC;

-- =========================================================
-- 7. Salário Médio por Situação
-- =========================================================

SELECT
Attrition,
ROUND(AVG(MonthlyIncome),2) AS salario_medio
FROM funcionarios
GROUP BY Attrition;

-- =========================================================
-- 8. Hora Extra x Turnover
-- =========================================================

SELECT
OverTime,
Attrition,
COUNT(*) AS quantidade
FROM funcionarios
GROUP BY OverTime, Attrition;

-- =========================================================
-- 9. Turnover por Hora Extra
-- =========================================================

SELECT
OverTime,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS turnover_percentual
FROM funcionarios
GROUP BY OverTime;

-- =========================================================
-- 10. Satisfação x Turnover
-- =========================================================

SELECT
JobSatisfaction,
Attrition,
COUNT(*) AS quantidade
FROM funcionarios
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction;

-- =========================================================
-- 11. Turnover por Satisfação
-- =========================================================

SELECT
JobSatisfaction,
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS turnover_percentual
FROM funcionarios
GROUP BY JobSatisfaction;

-- =========================================================
-- 12. Desligamentos por Cargo
-- =========================================================

SELECT
JobRole,
COUNT(*) AS desligamentos
FROM funcionarios
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY desligamentos DESC;

-- =========================================================
-- 13. Total de Funcionários por Cargo
-- =========================================================

SELECT
JobRole,
COUNT(*) AS total_funcionarios
FROM funcionarios
GROUP BY JobRole
ORDER BY total_funcionarios DESC;

-- =========================================================
-- 14. Idade Média
-- =========================================================

SELECT
Attrition,
ROUND(AVG(Age),2) AS idade_media
FROM funcionarios
GROUP BY Attrition;

-- =========================================================
-- 15. Tempo Médio de Empresa
-- =========================================================

SELECT
Attrition,
ROUND(AVG(YearsAtCompany),2) AS tempo_medio_empresa
FROM funcionarios
GROUP BY Attrition;

-- =========================================================
-- Fim do Projeto
-- =========================================================
