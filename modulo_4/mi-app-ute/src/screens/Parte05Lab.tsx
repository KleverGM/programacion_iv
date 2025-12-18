import { StyleSheet, Text, View } from "react-native";
import { WelcomeScreen } from "./WelcomeScreen";
import { Badge } from "@/components/common/Badge";

export function Parte05Lab() {
  return (
    <View style={styles.container}>
      <Text style={styles.h1}>Parte 5 Lab — Componentes & Props</Text>

      <View style={[styles.stage, { padding: 16 }]}>
        <Badge label="INFO" variant="INFO" />
        <View style={{ height: 10 }} />
        <Badge label="SUCCESS" variant="SUCCESS" />
        <View style={{ height: 10 }} />
        <Badge label="WARNING" variant="WARNING" />
        <View style={{ height: 10 }} />
        <Badge label="DANGER" variant="DANGER" />
        </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
  },
  h1: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
    marginBottom: 12,
  },
  stage: {
    flex: 1,
    borderRadius: 12,
    overflow: "hidden",
    borderWidth: 1,
    borderColor: "#30363d",
  },
});