package type;
public class IntegerType extends Type {
    public IntegerType() {
        super("int");
    }

    @Override
    public boolean subtype(Type other) {
        return super.subtype(other) || other.name().equals("numeric");
    }
}