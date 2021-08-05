package notafiscal;

public class Cliente {
	private int codigo;
	private String nome;
    private String cnpj;
    
  //Constructores
    public Cliente() {}
  	public Cliente(int codigo, String nome, String cnpj) {
  		this.setCodigo(codigo);
  		this.setNome(nome);
  		this.setCnpj(cnpj);
  	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	public String toString() {
		return "Código do cliente: "+this.codigo+", Nome: "+this.nome+", CNPJ: "+this.cnpj;
	}
}
