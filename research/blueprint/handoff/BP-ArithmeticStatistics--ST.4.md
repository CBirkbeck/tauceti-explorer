# Handoff: BP-ArithmeticStatistics--ST.4

Refs #6356. Codex (GPT-6), session `codex-hn1Qs5`, 10 October 2026. Branch `codex-hn1Qs5-arithmetic-statistics-st4`.

## Submission and scope

This is a complete target-level planning pass for ST.4, with coverage **planned**. It is not a checkpoint and does not mark ST.4 closed. Every node has implementation status unchecked. The forty-two accepted parent ST.4 targets remain imports, including their existing qualifications; the part covers the parent’s BGW, Bhargava–Skinner/Skinner and soluble plane-cubic remaining routes. Only the issue’s packet, reader, suggested file and this handoff are changed.

The initial open `swarm`/`state:available` query returned 705 issues; none of the manager’s explicit priority list was available. The focus review candidates #6521, #6217, #5871, #5869 and #5542 had previously recorded administrative scope/output mismatches or finished submissions under their stale available labels. Eligible blueprint #6356 had matching issue/queue output paths and no prior part file. The claim comment was `/claim Codex — codex-hn1Qs5` ([6102806668](https://github.com/CBirkbeck/tauceti-explorer/issues/6356#issuecomment-6102806668)); the [bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/6356#issuecomment-6102807918) was checked and the entire issue reread before work. Only this job was claimed. No independent review of this worker’s own work is asserted.

## Deliverables and counts

- [Packet](../packets/ArithmeticStatistics--ST.4.json): 41 nodes — 4 definitions, 32 theorems, 3 applications and 2 comparisons; 20 API items; 17 discriminating unit tests; 8 checked pinned baseline declarations; 18 explicit supplier requests; 6 gaps.
- [Reader](../readmes/ArithmeticStatistics--ST.4.md): precise objects, hypotheses, proof routes, source theorem/section/page locators, every API and test, the parent-import register, source repairs and the supplier/acceptance registers. It uses authored mathematical prose without source excerpts or source-section summaries.
- [Suggested Lean](../suggested/ArithmeticStatistics--ST.4.lean): concrete admissibility, local-intersection restriction, odd-component sum and the exact rank-one sieve family, every API/test, and an actual ten-coefficient soluble-plane-cubic proportion. Thirty-six native geometric theorem signatures are explicitly omitted and named in the file and packet; the definitive mathematical statements remain in the reader. No assumed endpoint fields or arbitrary counting functions stand in for those missing interfaces.
- Planets: zero new planets, retaining the parent’s six ST.4 planets. The parent already fills the layer budget; assembly must choose any replacements across the whole layer.

## Evidence and mathematical decisions

The pinned source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only upstream roadmap and library trees were screened at `070dc2becd74419e76303ede84b465ed4a69461f` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Two nearby complete roadmap documents were read: JacobianChallenge and GlobalQuadraticForms. Existing EllipticCurves, RepresentationTheory, ClassFieldTheory, adelic, lattice and post-snapshot roadmap constructions remain suppliers. No current upstream/library tree was modified or built. The reviewed library audit’s partial ST.4 assessment was retained: explicit elliptic two-descent is already there, while general torsor-Selmer, five-descent and analytic-rank interfaces are not supplied by that declaration.

The packet records nine primary-source PDF versions and SHA-256 fingerprints, together with the exact sections actually read. BGW’s main count/consequence proofs and appendix, the Bhargava–Skinner statistical proof, and the plane-cubic coefficient-box proof were read. Poonen–Stoll’s divisor/deficiency and pairing statements and the needed regulator/self-duality statements were inspected. The converse proof itself, the genus-uniform local-density proof and the general Tamagawa proof remain explicit supplier/source boundaries; their introductions or cited statements are not represented as complete proof readings. No book from the cleared library was needed or copied.

The important conventions are:

1. Average #Sel₂(J¹) is a limsup upper bound of two. The object is a torsor Selmer set, with empty sets allowed, and the numerator has no added identity element. Compatible measures, all real strata and the specifically routed central-quotient Tamagawa value are retained.
2. Actual local degree-one divisors and relative Picard points are distinguished. Odd-degree global points give local actual Div¹, rather than necessarily local C-points. The growing-genus target therefore includes the full locally actual-Div¹ family, with height tending to infinity first.
3. The core general-family sieve uses containment of every excluded p-adic lift in the codimension-two bad reduction locus. The reduction-only printed Definition 39 is weaker. Its full extension is a gap rather than a falsely closed tail. The dyadic repair of Theorem 44 is also explicit.
4. Appendix parity concerns finite 2-Selmer dimension or 2∞ corank as specified. Mordell–Weil parity only follows under the stated Sha finiteness assumption. The finite p-primary Sha quotient and the Poonen–Stoll actual-divisor deficiency correction remain present. The explicit A.1 lower bound uses disjoint four-twist blocks: x²-coefficient residues 1,7,2,6 modulo eight recover their original member, giving density 2^(−4n−4).
5. Rank one uses **p=5** and average #Sel₅=6. Proposition 17 yields one-half at five and zero at three. The original semistable curve uses Skinner’s Q criterion; the ramified −39 twist uses the imaginary-quadratic criterion. The exact twist height factor is 39⁶ and the resulting class-count factor is 39⁵.
6. Soluble ternary cubics are counted in a ten-coordinate coefficient cube, without a scalar/isomorphism quotient. The intermediate height is H_AB; the I,J conversion is stated explicitly. The cusp transfer subtracts bounded-intersection lattice asymptotics from the total count, rather than relying only on finite volume.

The exact coefficient witness (−136,16) has d=39277=7·31·181, square discriminant residue 10 modulo39, nonsquare 864B residue6 modulo7, and eight points over F₅. The ordinary-only non-example (−1000,1136) has squarefree d=15488893=7·2212699 and six points over F₅. These integer/residue checks were independently computed in scratch; the Lean tests carry placeholder proofs and make no implementation claim.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticStatistics--ST.4.json`: **0 errors, 0 warnings**, using the available pinned declaration index.
- `lean-check research/blueprint/suggested/ArithmeticStatistics--ST.4.lean`: final **exit 0**, with **39 warnings, all declaration uses `sorry`**, no errors or other warnings. Available memory exceeded 20 GB. Only the supplied shared pinned build was used; no language server, dependency update, cache fetch or build was started.
- The actual generated `Filter.liminf` declaration elaborates at the pin. The source-scanning index omits that generated name, so the packet cites the checked `Filter.limsup` definition with its explicit order-dual generation; this is not a claim that an unchecked name appears in the index.
- Final agreement checks cover all four definitions, 20 API names, 17 named test examples and every omitted target name in packet/reader/suggested file. Repository paths remain restricted to the four authorized outputs; source PDFs and extracted texts stay out of the repository.

## What remains and where to resume

Independent review is the next job. It must check the six paraphrased source findings, the exact supplier contracts and the normalization conversions. Two findings import already independently confirmed BGW repairs; the new saturation, factorisation, odd-dimensional counting and probability-endpoint findings carry no self-review verdict.

The stage remains open for six exact obligations, all with consumers and resolution instructions in the packet/reader:

- **G-native:** discharge the 18 supplier contracts and add the 36 omitted geometric theorem signatures using their actual objects and maps.
- **G-large-saturation:** prove the printed weak-family tail implication or amend its hypotheses; do not confuse this with the valid full-family/admissible applications.
- **G-converse:** register the already routed `DESIGN-SKINNER` RankOneConverse direction and import Skinner B/C under their precise hypotheses.
- **G-tamagawa:** verify a general simply connected/central-isogeny volume theorem under AdelicAlgebraicGroups, Part II, then evaluate the ST.4-specific quotient. Kottwitz’s publisher record was located; its proof was not read.
- **G-uniform-genus:** verify the cited local-solubility proportion uniformly in genus with the same coefficient cube and use the fixed-few-root probability consequence from PM.1.
- **G-number-field:** supply fixed-basis O_K coefficient boxes, CRT/tail and finite twist-height/fibre comparisons for Appendix A.2.

The API extensions belong to their named owners: the ST.1 Pfaffian five-cover and ternary-cover dictionaries; ST.2 weighted exceptional-stabilizer, common-Jacobian and bounded-intersection counts; ST.5 large-family five-Selmer average/local weights; general descent/Selmer and Poonen–Stoll duality; Néron modified factors; RepresentationTheory, Part II regulator constants; and AdelicAlgebraicGroups, Part II general Tamagawa formulas. No general definition was moved into ST.4 from a higher-tier owner. The existing parent average definitions precede the ST.5 first-moment inputs used by these added statistical applications; their precise target imports do not require completion of all later ST.5 targets.

Assembly should correct the parent’s remaining-list note that names the three-Selmer average for Bhargava–Skinner. That parent file and all review/queue files were outside this issue’s edit scope and are unchanged. All durable source URLs, hashes, read coverage, decisions and remaining tasks are in these outputs. Scratch is disposable after the pull request opens.
