import { View, StyleSheet } from "react-native";
import ServiceCostMemo from "./components/useCallback/ServiceCostMemo";
import FuelConsumptionMemo from "./components/useMemo/FuelConsumptionMemo";

function App() {
  return (
    <View style={styles.container}>
      <FuelConsumptionMemo />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});

export default App;
