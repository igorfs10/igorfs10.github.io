--View com as vendas de cada vendedor
CREATE VIEW vendas_por_vendedor AS
	SELECT vendedor.c_nomevende as Funcionário,
		venda.n_totavenda as Total_Da_Venda
	FROM tbl_vendedor AS vendedor,
		tbl_venda AS venda
	WHERE venda.n_numevende = vendedor.n_numevende
	ORDER BY Funcionário
;
--SELECT * FROM vendas_por_vendedor;

--View com todas as compras e produtos de cada cliente
CREATE VIEW compras_efetuadas_por_cliente AS
	SELECT cliente.c_nomeclien AS Cliente,
		venda.c_codivenda AS Numero_Da_Venda,
		produto.c_descprodu AS Produto,
		item.n_valoivenda AS Valor_Produto,
		venda.n_totavenda AS Total_Da_Venda
	FROM tbl_cliente AS cliente,
		tbl_venda AS venda,
		tbl_itens_venda AS item,
		tbl_produto AS produto
	WHERE venda.n_numeclien = cliente.n_numeclien
		AND item.n_numevenda = venda.n_numevenda
		AND item.n_numeprodu = produto.n_numeprodu
	ORDER BY Cliente
;
--SELECT * FROM compras_efetuadas_por_cliente;

--View com nome dos vendedores, data e comissao
CREATE VIEW comissao AS
	SELECT vendedor.c_nomevende AS Funcionário,
		d_datapagam AS Data_De_Pagamento,
		n_valorcomi AS Valor_Comissao
	FROM tbl_vendedor AS vendedor,
		tbl_comissao_mensal AS comissao
	WHERE comissao.n_numevende = vendedor.n_numevende
	ORDER BY Funcionário
;

--Calculo de Comissão. Tem que passar o mes, ano e Id do vendedor como parametro
DELIMITER #
CREATE PROCEDURE sp_calcular_comissao(IN _mes INT, IN _ano INT, IN _idVendedor INT)
BEGIN
	DECLARE comissao INT;
	DECLARE mesPagamento INT;
	DECLARE anoPagamento INT;
	DECLARE diaPagamento INT;
	DECLARE dtPagamento DATE;
	DECLARE totalMes INT;
	
	SET diaPagamento = 5;
	IF _mes > 11 THEN
		SET mesPagamento = 1;
		SET anoPagamento = _ano + 1;
	ELSE
		SET mesPagamento = _mes + 1;
		SET anoPagamento = _ano;
	END IF;
	
	SELECT SUM(n_totavenda) 
    FROM tbl_venda 
    WHERE MONTH(d_datavenda) = _mes
	AND YEAR(d_datavenda) = _ano
    AND n_numevende = _idVendedor
    INTO totalMes;
	
	IF totalMes < 25000 THEN
		SET comissao = totalMes * (2 / 100);
	ELSEIF totalMes < 50000 THEN
		SET comissao = totalMes * (5 / 100);
	ELSE
		SET comissao = totalMes * (8 / 100);
	END IF;
	
	SET dtPagamento = CONCAT(anoPagamento,"-",mesPagamento,"-",diaPagamento);
	
	INSERT INTO tbl_comissao_mensal (n_numevende, d_datapagam, n_valorcomi) VALUES (_idVendedor, dtPagamento, comissao);
END #
DELIMITER ;