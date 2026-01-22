import {  useState, useMemo} from "react";
import { View, Text, TextInput } from "react-native";

export default function ServiceCostMemo() {
  const [labor, setLabor] = useState(0);
  const [parts, setParts] = useState(0);
  const [serviceType, setServiceType] = useState('normal');

  const total= useMemo(() => {
    const base=labor + parts;
    return serviceType.toLocaleLowerCase() === 'urgente' ? base * 1.5 : base;
  }, [labor, parts, serviceType]);

  return (
    <View
      style={{ padding: 16, borderWidth: 1, borderRadius: 8, marginBottom: 14 }}
    >
      <Text>
        Costo de Servicio
      </Text>
      <TextInput
        keyboardType="numeric"
        placeholder="Labor"
        onChangeText={(v)=> setLabor(Number(v)||0)}
        style={{
          borderWidth: 1,
          padding: 10,
          marginTop: 10,
        }}
      />
      <TextInput
        keyboardType="numeric"
        placeholder="Parts"
        onChangeText={(v)=> setParts(Number(v)||0)}
        style={{
          borderWidth: 1,
          padding: 10,
          marginTop: 10,
        }}
      />
      <TextInput
      keyboardType="numeric"
      placeholder="normal/urgente"
      onChangeText={setServiceType}
      style={{
        borderWidth: 1,
        padding: 10,
        marginTop: 10,
      }}
    />
      <Text>
        Total: <Text style={{ fontWeight: "700" }}>{total.toFixed(2) || "------"}</Text>
      </Text>
    </View>
  );
}
