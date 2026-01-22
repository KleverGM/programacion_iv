import {  useState, useCallback} from "react";
import { View, Text, TextInput, Button } from "react-native";


export default function TirePressureCheck() {
  const [currentPSI, setCurrentPSI] = useState(0);
  const [tire, setTire] = useState('delantera');
  const [needPSI, setNeedPSI] = useState(0);
  const IDEAL=32;

  const calculate= useCallback(() => {
    const missing=Math.max(0, IDEAL - currentPSI);
    setNeedPSI(missing);
  }, [currentPSI, tire]);

  return (
    <View
      style={{ padding: 16, borderWidth: 1, borderRadius: 8, marginBottom: 14 }}
    >
      <Text>
        Pression de la llanta
      </Text>
      <TextInput
        placeholder="delantera/trasera"
        onChangeText={setTire}
        style={{
          borderWidth: 1,
          padding: 10,
          marginTop: 10,
        }}
      />
      <TextInput
        keyboardType="numeric"
        placeholder="Presion actual"
        onChangeText={(v) => setCurrentPSI(Number(v) || 0)}
        style={{
          borderWidth: 1,
          padding: 10,
          marginTop: 10,
        }}
      />
      <TextInput
        keyboardType="numeric"
        placeholder="precion actual"
        onChangeText={(v) => setCurrentPSI(Number(v) || 0)}
        style={{
          borderWidth: 1,
          padding: 10,
          marginTop: 10,
        }}
      />
      <View>
        <Button title="Calcular faltante" onPress={calculate} />
      </View>
      <Text>
        PSI faltante para la llanta {tire}:{" "}
        <Text style={{ fontWeight: "700" }}>{needPSI || "------"}</Text>
      </Text>        
    </View>
  );
}
