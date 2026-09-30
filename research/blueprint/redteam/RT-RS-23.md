# RT-RS-23 — Hilbert and PEL ownership audit

Codex, session `codex-rtOQ9t`. Refs #5117. Complete at input commit `c11b1ea929634cf2e497111b56517d9c6dd474e0`.

**One medium finding.** The proposal’s four narrowings preserve their targets and all fourteen links are present and acyclic. Its unchanged R18.3 contract still omits the generic algebraic-forms supplier boundary already confirmed in RT-AREA-automorphic-1/31. That residual is credited to the earlier audit; this report does not present it as a new discovery.

I did not write or review RS-23. The author was ChatGPT, session `astra-7c41e9`; the reviewer was Claude Code, session `cc-39fac3`.

## The four narrowings

| Layer | Original target checked | Conservation decision |
|---|---|---|
| H0 | Rational groups G/G*, domains, reflex fields, trace embedding, Hodge/abelian type | D5 supplies the same rational objects and embedding. H0 keeps centres/derived-group and domain comparisons, the integral trace lattice/different refinement and type witnesses. No principal polarization ideal or embedding of the full arithmetic G is assumed. |
| H1 | Symmetric real-multiplication Hom module and positive cone, c-polarization, tame/other levels, determinant, complex comparison, trace/Weil dictionary | M0–M3 supply the generic construction. The ordered invertible module, full polynomial condition, ideal/generator changes and actual comparison maps remain in H1. The ramified and dyadic integral model is retained in H2. |
| M5 | Siegel, genus-one, Hilbert, unitary and nonprincipal examples | D5/H0/H1 supply successive rational, integral and polarization-module Hilbert outputs. Siegel and unitary examples and the acceptance comparisons remain. The specific Hilbert construction is not sent backward from M5 to the generic M0–M4 engine. |
| M6 | Arbitrary-level stacks, fine objects/families, Hodge line, arithmetic descent and nonemptiness | M1/M2 supply the category and rigidified space/family. M6 retains the actual arbitrary-level stack algebraicity theorem, Hodge-line construction, rational-family obstruction and arithmetic exports. The later integral scheme/quasi-projective suffix alone uses C5. |

The remaining sixteen stage decisions were checked against both full member documents. In particular, good-prime PEL smoothness is not substituted for H2’s ramified/p=2 model; M4 normalization is not substituted for R18.2’s Carayol bad-prime geometry; H4 keeps subgroup conditions distinct from characteristic-zero full-level trivializations. H6 still constructs twists, selected components and prescribed local points, which untwisted nonemptiness cannot supply.

The nine owner records correctly distinguish the rational Hilbert datum (D5), integral trace-lattice refinement (H0), polarization-module instance (H1), generic PEL data/functors/representability/complex comparison (M0–M3), and good-base higher-level normalization (M4). M2 constructs the fine universal family; M6 exports it with its newly constructed Hodge line. The one missing cross-family owner is discussed below.

## Finding

### RT-RS-23/1 — medium, duplicate

**Where:** research/blueprint/restructure/RS-23.result.json: layers.HilbertModularVarietiesAndShimuraCurves:R18.3, owners and links

The accepted proposal retains the generic coefficient-function-space, Hecke and level-change construction in R18.3 without assigning it the existing general automorphic-forms supplier. AF.5 still plans the algebraic-modular-form/finite-double-coset dictionary and the live graph gives R18.3 no path from it. The quaternionic specialization, integral stabilizer calculations, Taylor-Wiles freeness, dyadic twists and Jacquet-Langlands comparison must remain; the missing boundary is the reusable generic API. This is the still-unapplied RS-23 portion of confirmed RT-AREA-automorphic-1/31, not a new discovery of that overlap.

**Evidence:** RS-23 R18.3 reason says "Keep definite quaternionic forms on actual finite double-coset sets, their coefficient and Hecke operations". The member README R18.3 says "Define algebraic automorphic forms on the finite double-coset set with their weight module and integral coefficients" and then asks for Hecke action and change of level. AutomorphicFormsOnReductiveGroups README AF.4 supplies algebraic coefficient systems with lattices; AF.5 says "Identify algebraic modular forms on compact-at-infinity groups with functions on finite adelic double cosets valued in an algebraic representation". The reviewed library-coverage R18.3 duplicate entry names AF.5. RT-AREA-automorphic-1.review.json confirms /31 specifically as a missing generic-to-quaternionic ownership bridge. Its fixes report /31 item 5 expressly requests an RS-23 correction. At c11b1ea929634cf2e497111b56517d9c6dd474e0, no such owner or link occurs, AF.5:algebraic-forms is not a live stage, and the current AF.5 -> R18.3 edge is absent.

**Repair:** Narrow R18.3 explicitly to the quaternionic specialization, class-set/stabilizer calculations, source-specific integral freeness and dyadic tests, and the GL2/Jacquet-Langlands comparison. Give the generic coefficient, Hecke and level-change API one named AF owner and add its supplier/forwarding link. The existing AF.5 -> R18.3 link is acyclic and can be used with an exact prefix contract; the earlier fix instead proposes a new AF.5:algebraic-forms prefix depending on AF.4. If using that split, coordinate creation/promotion of the prefix and its AF.4/AF.5 links before claiming it is available. Add the owner record and update the report; do not move all AF.5 or remove the genuine quaternionic and Taylor-Wiles theorems. Apply only through the authorized restructuring/blueprint workflow.

The earlier fixes report gives an explicit future `AF.5:algebraic-forms` prefix and an RS-23 edit. That prefix is absent at this audit’s commit. A proposed node in a fixes report is not already a supplier. Importing the current AF.5 contract is acyclic, while choosing the smaller prefix requires its actual coordinated creation. Neither choice discharges quaternionic stabilizers or Taylor–Wiles freeness merely from finiteness of a double-coset set.

I also checked the related RT-AREA-langlands-2/19 issue. Its later fixes report distinguishes the Galois-free quaternionic freeness/twisting lemmas from control/rank statements using local–global compatibility, which belong to R22.2. It expressly says RS-23’s R18.3 keep agrees with that owner. I therefore do not repeat that issue as an error in RS-23 or suggest importing the later Galois theory into R18.3.

## Consumers and current graph

The fresh assembly contains 2,907 stage records and 8,322 stage edges. Including external/unmaterialized prerequisite endpoints gives 2,958 vertices. The whole graph, already containing all fourteen RS-23 links, is acyclic. All twenty member stage IDs, all supplier IDs and all owner IDs exist; no proposal link is deferred. No claim is made that every external prerequisite is implemented.

There are thirteen distinct immediate consumers of the four narrowed stages. Their full descriptions were inspected, including their current restructuring metadata:

- H0’s consumers H1 and M5 both receive D5 without traversing H0.
- H1’s consumers H2 and M5 reach M0–M3 without traversing H1.
- M5 now feeds AutomorphicCongruences L1 and AutomorphicPadicLFunctions L4/L4e/L5. They consume its retained unitary example. The author report’s old sink argument is obsolete; the reviewer explicitly corrected it and the graph was recomputed here.
- M6’s six consumers are R35.2/R35.3/R35.5/R35.6 and R28.1/R28.2. They retain its Hodge-line and arithmetic-descent outputs, and each has an M1/M2 supplier path avoiding M6.

The explicit requests in the Faltings packet retain the stack/family/Hodge-line and Galois-form comparison; C6’s request retains the polarization-module/trace convention used in its cusp lattice. The cusp computation remains a consumer theorem. The examined general/special boundaries do not assert that a parameter space is flat because its universal abelian family is flat, or that a rational coarse point is a rational family.

The accepted RS-02 A5 contract concerns genus-one analytic uniformization and its family/pairing comparison. This is an earlier input to the algebraic moduli comparison retained at M5, not evidence that the whole M5 example should disappear. RS-06’s M6 export boundary and RS-14’s unitary-example owner are preserved by the corrected JSON. M6’s separate arithmetic nonemptiness tests need not wait for M5’s complete Hilbert/canonical-model example sequence; they still must give actual instances on the M1/M2 carriers.

Reproduction of the principal graph checks, from the input commit:

```python
import collections, graphlib, json, sys
sys.path.insert(0, "scripts")
from build import assemble
a = assemble(require_distances=False)[0]
p = json.load(open("research/blueprint/restructure/RS-23.result.json"))
stages = {s["id"]: s for s in a["stages"]}
edges = {(e["source"], e["target"]) for e in a["stageEdges"]}
assert len(stages) == 2907 and len(edges) == 8322
assert len(p["layers"]) == 20 and len(p["owners"]) == 9
assert len(p["links"]) == 14
assert all((e["source"], e["target"]) in edges for e in p["links"])
g = {s: set() for s in stages}
adj = collections.defaultdict(set)
for source, target in edges:
    g.setdefault(target, set()).add(source)
    g.setdefault(source, set())
    adj[source].add(target)
assert len(tuple(graphlib.TopologicalSorter(g).static_order())) == 2958

def reaches(source, target, avoid=None):
    seen = {source, avoid}
    todo = [source]
    while todo:
        v = todo.pop()
        if v == target:
            return True
        for w in adj[v]:
            if w not in seen:
                seen.add(w)
                todo.append(w)
    return False

for layer, entry in p["layers"].items():
    assert layer in stages and not layer.startswith("tauceti:")
    if entry["action"] == "narrow":
        for supplier in entry["suppliedBy"]:
            assert supplier in stages and reaches(supplier, layer)
            for consumer in stages[layer]["consumers"]:
                assert reaches(supplier, consumer, avoid=layer)
assert not reaches("AutomorphicFormsOnReductiveGroups:AF.5",
                   "HilbertModularVarietiesAndShimuraCurves:R18.3")
g["HilbertModularVarietiesAndShimuraCurves:R18.3"].add(
    "AutomorphicFormsOnReductiveGroups:AF.5")
assert len(tuple(graphlib.TopologicalSorter(g).static_order())) == 2958
```

## Sources and library scope

I read the actual definitions of `Submodule.traceDual`, `Submodule.mem_traceDual` and `FractionalIdeal.dual` in Mathlib’s `RingTheory/DedekindDomain/Different.lean` at `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their surrounding hypotheses. The fractional-ideal construction uses the integrally closed/integral-closure, finite-dimensional separable-extension and fraction-field setting; it is not a polarization module on an abelian scheme. The proposal correctly reuses this primitive without claiming it supplies the moduli or Weil-pairing comparison. Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` is recorded, but no new Tau Ceti declaration claim is made.

The published [Birkbeck–Heuer–Williams PDF](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf), 87 PDF pages, was acquired on 30 September 2026 (SHA-256 `d59b7f701eb5258c351d959be08d49f17946245ed1e5779317d2371981c2c5c4`). I read only §5.1, printed pp.1740–1745, and visually checked p.1743’s pairing diagram. Its trace/different convention, c-polarization, dual-abelian level convention, scalar similitude condition, and characteristic-zero full-level scope agree with the distinctions retained in H0/H1/H4. The tame moduli model is over the stated localized integer base. No source-wide extraction or inspection of the cited representability proofs is claimed.

The reviewed library coverage for the four narrowed layers and the adjacent generic/good-prime model layers was read as inherited audit evidence. This report does not renew every absence assertion in those old rows. It makes no Lean implementation claim and no source erratum claim.

## Validation and boundaries

`check_restructure.py` passed on the accepted input. `check_redteam.py`, intake `check-files`, the report’s graph reproduction and the staged whitespace check passed for the submitted deliverables. No Lean file is required; no compiler, Lake project/cache operation or language server was run. Only the two red-team deliverables are changed. No upstream roadmap or upstream-to-upstream link is edited.

## Input fingerprints

| Input | SHA-256 |
|---|---|
| `research/blueprint/restructure/RS-23.result.json` | `412e0a564dc41e311e8913fe8591f7ca0c91393da200885a3c7b988f6342747d` |
| `research/blueprint/restructure/RS-23.md` | `3b42a658708e0fbbae096319073b59741a558f5d9df2a2e32ae6f4a3a0d40bd4` |
| `research/blueprint/restructure/RS-23.json` | `15701acd970c2970e4f3f647d5f5efd1b073ec18e042443130273a823bebca3c` |
| `research/blueprint/reviews/REV-RS-23.md` | `3a50684d2c8ad5e84012e809ec8e8ae5fb23d9c31722acb2732f44bfb4949388` |
| `content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md` | `6f67870de4ae55e16e207394e8068f1d4382acdc6a7cd871a1f6f940ef71dd6f` |
| `content/campaign/PELModuli/README.md` | `fe286a3639b58ab7b201c9504eaeebb42738bc782fbf09cc47dc7b09d080a166` |
| `content/campaign/ShimuraData/README.md` | `288531ce0c46b80166f4688a70b84e92e13d0685e475a5308d3cfeed416c9976` |
