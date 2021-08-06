package notafiscal;

public class ItemNotaFiscal {
	private int item;
    private int quantidade;
    private Produto produto;
    
    public ItemNotaFiscal(){}
    public ItemNotaFiscal(int item, int quantidade, Produto produto){
        this.setItem(item);
        this.setQuantidade(quantidade);
        this.setProduto(produto);
    }
	public int getItem() {
		return item;
	}
	public void setItem(int item) {
		this.item = item;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public Produto getProduto() {
		return produto;
	}
	public void setProduto(Produto produto) {
		this.produto = produto;
	}
	public String toString(){
		return "Item: "+this.item+", Produto: "+this.produto+", Quantidade: "+this.quantidade;
	}
}
