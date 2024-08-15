create or replace package pkg_calculadora as 
    procedure sp_novo_salario(p_salario in number);
    function sf_dolar_real(p_dolar number) return number;
end pkg_calculadora;
/

create or replace package body pkg_calculadora as
    procedure sp_novo_salario(p_salario in number) as
    v_novo_salario number;
    begin 
    v_novo_salario := p_salario * 1.25;
    dbms_output.put_line('Novo salário: R$'||v_novo_salario);
    dbms_output.put_line('Salário atual: R$'||p_salario);
    end;
    
    function sf_dolar_real(p_dolar number)
    return number is
    v_cotacao number (4,2) := '&QUAL_A_COTACAO_DO_DOLAR';
    v_real number(10,2);
    begin
    v_real := p_dolar * v_cotacao;
    return v_real;
    end;
    
end pkg_calculadora;
/

set serveroutput on
declare 
begin
pkg_calculadora.sp_novo_salario(1302);
dbms_output.put_line('Valor em reais é de: R$'||pkg_calculadora.sf_dolar_real(45));
end;
/