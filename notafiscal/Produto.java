package notafiscal;

public class Produto {
	private int codigo;
    private String descricao;
    private float valor;
    
    public Produto(){}
    public Produto(int codigo, String descricao, float valor){
        this.setCodigo(codigo);
        this.setDescricao(descricao);
        this.setValor(valor);
    }
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public float getValor() {
		return valor;
	}
	public void setValor(float valor) {
		this.valor = valor;
	}
    public String toString(){
    	return "Código do produto: "+this.codigo+", Descricao: "+this.descricao+", Valor: "+this.valor;
	}
}
