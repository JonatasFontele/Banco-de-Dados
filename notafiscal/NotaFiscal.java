package notafiscal;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NotaFiscal {
	private int codigo;
    private Date data;
    private Cliente cliente;
    private List<ItemNotaFiscal> itens = new ArrayList<ItemNotaFiscal>();
    
    public NotaFiscal(){}
    public NotaFiscal(int codigo, Date data, Cliente cliente){
        this.setCodigo(codigo);
        this.setData(data);
        this.setCliente(cliente);
    }
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public List<ItemNotaFiscal> getItens() {
		return itens;
	}
	public void setItens(List<ItemNotaFiscal> itens) {
		this.itens = itens;
	}
    public float calcularValor(){
    	for(int i=0; i<itens.size(); i++){
    		itens.get(i).quantidade * itens.get(i).produto.valor;
    		<quantidade do item> * <valor do produto>
    	}
    }
	public void inserirItem(ItemNotaFiscal itemNotaFiscal){
		itens.add(itemNotaFiscal);
	}
	public String toString(){
    	return "Código da Nota Fiscal: "+this.codigo+", Data: "+this.data;
	}
	public String resumo(){
    	String resumo = toString()+"\n";
    	for(int i=0; i<itens.size(); i++){
    		itens.get(i).quantidade * itens.get(i).produto.valor;
    		<quantidade do item> * <valor do produto>
    	}
	}
}
