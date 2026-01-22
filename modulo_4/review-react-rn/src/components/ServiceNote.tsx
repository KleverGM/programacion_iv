import { useState } from "react";
import { View, Text, TextInput } from "react-native";

export default function ServiceNote() {
  const [note, setNote] = useState("");

  return (
    <View
      style={{ padding: 16, borderWidth: 1, borderRadius: 8, marginBottom: 14 }}
    >
      <Text>Nota de Servicio</Text>
      <TextInput
        placeholder="Ej de cambio de estado"
        value={note}
        onChangeText={setNote}
        style={{
          borderWidth: 1,
          padding: 10,
          marginTop: 10,
        }}
      />
      <Text>
        Observacion:{" "}
        <Text style={{ fontWeight: "700" }}>{note || "-----"}</Text>
      </Text>
    </View>
  );
}
