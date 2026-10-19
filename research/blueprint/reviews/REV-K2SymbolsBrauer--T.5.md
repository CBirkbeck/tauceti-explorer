# Independent review of K2SymbolsBrauer, part T.5

**Accepted after corrections.** Job `REV-K2SymbolsBrauer--T.5`, issue #10789; reviewer Codex, session `codex-XZ4u6j`, 19 October 2026. This session did not write the blueprint being reviewed. The verdict is recorded as `independent-review-REV-K2SymbolsBrauer--T.5` in the packet.

The packet remains a complete target-level planning pass, with T.5 **planned**, not closed or formalised. Its seven new targets supply the missing monomial-kernel argument; eleven inherited T.5 targets and the separately owned finite-field result provide the arithmetic context. The original issue also names T.6 and T.7, but the delivered T.5 follow-up does not own them: `BP-K2SymbolsBrauer--T.6` (#10817) supplies that separate part. This review does not accept that other packet.

## Counts and verdicts

| Item | Before | After |
|---|---:|---:|
| New target nodes | 7 | 7 |
| Definition/construction API items | 22 | 29 |
| Unit tests | 10 | 14 |
| Baseline declarations | 16 | 19 |
| New planets on the seven nodes | 0 | 0 |
| Routed amendments | 15 | 15 |
| Added/removed nodes | — | 0 / 0 |
| Suggested-file admitted declarations | 30 | 23 |

All seven nodes retain their identifiers under `K2SymbolsBrauer:T.2:symbols/monomial-kernel/`. Keeping this input below T.5 avoids the reverse dependency through finite-field K₂ and the real sign symbol. No proof has been split into auxiliary roadmap nodes.

| Node suffix | Verdict | Source checked and conclusion |
|---|---|---|
| `monomial-subgroup` | verified | Milnor Lemma 9.1, pp.71–72; image is the determinant-one monomial subgroup, with arbitrary units rather than just signs. |
| `weyl-conjugation` | corrected | Milnor 9.2–9.5, pp.72–74; checked the root-index cases, torus normality and centrality. Added the zero-ring branch. |
| `finite-rank-symbol` | corrected | Milnor 9.6–9.8, pp.74–75, with §8, pp.63–66; checked centrality, the torus cocycle, index independence, bilinearity and Steinberg identity. Removed an unjustified embedding notation. |
| `generated-by-symbols` | corrected | Milnor 9.10–9.11, pp.75–77; checked word reduction modulo symbols and the final diagonal argument over commutative rings. Separated the zero ring and repaired the symmetric-group quotient qualification. |
| `upper-unipotent-normal-form` | corrected | Milnor 9.14, pp.78–79; ordered collection and successive entry recovery give unique coordinates. Exposed the construction, its API and tests. |
| `field-bruhat-cover` | verified | Milnor 9.15, pp.79–80; checked complementary positive roots and the nonzero-parameter factorization used in the simple-reflection reduction. |
| `field-kernel-is-monomial` | corrected | Milnor 9.12–9.13, pp.77–80; TWT and the monomial/upper-unitriangular intersection give the kernel description, including over 𝔽₂. Made the independent finite-field annihilator input explicit. |

## Corrections made in place

1. Before extracting a permutation from monomial coordinates, the proof now handles the zero ring directly: every root generator is trivial. The quotient `W/H ≃ Sym(n)` is asserted only for a nonzero ring. This preserves the general commutative-ring theorem without a hidden nontriviality hypothesis.
2. A computation described as taking place in `St₃(A) ⊆ Stₙ(A)` now takes place on three chosen indices, or is transported by the rank-raising homomorphism. No injectivity of unstable stabilization is assumed.
3. The proof that same-root diagonal lifts commute modulo the symbol subgroup now uses their multiplicative relation and `uv = vu`, rather than treating commutativity of the coefficient ring as sufficient to commute elements of the presented group.
4. Both nodes that advertise the finite-field consequence now cite `field-proof/cyclic-annihilator`. Field-symbol generation and this annihilator prove K₂(𝔽_q)=0 without Matsumoto. Only afterwards can the finite-field Matsumoto presentation follow from the vanishing of both sides.
5. `upper-unipotent-normal-form` is explicitly a construction. Its seven API entries cover the positive-root subgroup, the simple-root complement, ordered coordinates, the matrix group equivalence, extensionality, coefficient maps and unique simple-root factorization. Four tests distinguish ordered coordinates from matrix entries, detect noncommutativity, identify the complement and check the zero ring.
6. R5 now supplies actual proof-step amendments for the finite-field Milnor K₃ consumer and the elliptic Harder consumer, rather than only changing their prerequisite names. R4 distinguishes p-divisibility from the separate absence of p-torsion and explains why the residue kernel inherits both.
7. The suggested file uses `import Mathlib` and individual Tau Ceti imports. Five examples are proved; six formerly admitted examples are named theorem targets, also listed in the reader. Two matrix adapters are proved from existing pinned results. No Steinberg or K₂ carrier is invented, and no data definition is admitted.
8. The reader, suggested-file inventory, source records, compilation record and source-issue review are synchronized. No source excerpt was added; no `excerpt` fields remain.

## Sources and baseline

I independently read the public [Milnor scan](https://www.math.uni-bielefeld.de/~rehmann/DML/BOOKS/milnor.ocr.djvu), §§8–10, including the integer word model, Silvester reduction and kernel induction on pp.81–92. I read the relevant author-hosted [K-book Chapter III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), III.2.5 (p.14), III.5.1–5.2.2 (pp.35–36), III.5.10 (pp.42–43), III.6.1–6.3.1 (pp.48–51), III.6.5–6.7 (pp.52–55), and III.7.2 (p.61); [Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.1 and V.6.6–6.7.3 (pp.38–43); and [Chapter VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf), VI.6–6.2 (pp.37–38). Chapter-file page numbers are printed chapter pages. The packet records exact versions and hashes.

The [resolved 2022 errata snapshot](https://web.archive.org/web/20220422112332id_/https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf) replaces the failing shorter redirect. All three pages were read; they do not resolve the attribution issue at III.5.10.5. The published GSM edition was not read, so that finding remains scoped to the author chapter file.

The source issue `E-T5-division-ring-attribution` is **confirmed as an attribution gap**, not a disproof of the division-ring theorem. Milnor 9.11 assumes commutativity; 9.13 gives generation for fields. The skew-field version of 9.12 gives the monomial-kernel containment, which does not by itself supply generation by central Steinberg symbols. The division-ring and semilocal clauses are not used for the corrected T.5 proof.

All **19 baseline statements** were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No original citation was removed or replaced. The packet lists each exact module and statement:

- Mathlib: `Matrix.det_permutation`, `Subgroup.Normal`, `Subgroup.center`, `Subgroup.closure`, `commutatorElement`.
- Tau Ceti diagonal/normalizer: `diagGL`, `det_diagGL`, `permutationGL`, `permutationGL_mul_diagGL_mul_inv`, `UpperTriangularGroup.mem_diagonalTorus_of_mem`.
- Tau Ceti transvections: `transvectionUnit`, `transvectionUnit_injective`, `commute_transvectionUnit`, `commutatorElement_transvectionUnit`.
- Tau Ceti unitriangular groups: `upperUnitriangularGroup`, `UpperUnitriangularGroup.ext`.
- Added existing results: `Matrix.SpecialLinearGroup.diag2nUnit_decompose`, `TauCeti.transvectionWeylElement_mul_transvectionUnit_mul_inv_self`, `TauCeti.transvectionWeylElement_inv`. They support the two proved adapters, not new milestones.

The normalizer theorem assumes a field with a nontrivial unit group and therefore cannot establish the general-ring statement or the 𝔽₂ case. Its role remains guidance; the packet supplies the direct permutation argument. The permutation convention and the commutator convention match the pinned declarations.

The reviewed library audit was read. Current TauCetiRoadmap and current Tau Ceti were checked read-only, including ReductiveGroups and ClassFieldTheory and their suggested files. ReductiveGroups owns algebraic-group Bruhat theory, not this presented Steinberg-group argument. ClassFieldTheory owns the cohomological Hilbert pairing; the real sign pairing here is a Steinberg-symbol test. Existing matrix results are reused.

## Closure, routed ownership and remaining work

I checked the accepted T.1, T.1-classical, T.2-symbols and T.3 suppliers, U.4's two S-integer statements, and the three consumer nodes. All fifteen R2/R3/R5 rows were checked against the statements they amend. The finite-field annihilator uses the tensor symbol's universal property and elementary symbol calculus, without using Matsumoto or field-symbol generation. The inherited integer proof follows Milnor §10 once the new monomial result is attached. Localization supplies injectivity through finite-residue K₂ vanishing; U.4's Bass–Milnor–Serre result supplies surjectivity. Individual residue surjectivity alone would not suffice.

A traversal of the resolved node prerequisites, including the routed replacements and reachable supplier nodes, found 369 reachable nodes and no cycles. Stage references and other open supplier boundaries remain leaves of this check; it is not a claim that the entire atlas stage graph is closed. The new seven-node input has no T.5 ancestor.

The four assigned red-team findings are accounted for: findings 9 and 26 give the T.5 localization/U.4 inputs and ArithmeticKTheory ownership of certificates; findings 8 and 27 concern T.7 ownership and comparison inputs and remain with the separate T.6/T.7 part. No arithmetic certificate or cohomological comparison is replanned here.

Questions/actions for the orchestrator:

- Apply R2 to T.3, R3 to T.1 **in order**, and R5 to the three consumers during assembly or their fixes. Only then withdraw the old monomial/U.4 requests and obsolete finite-field gaps. This review does not edit those other packets.
- Preserve the inherited complete-DVR support gap affecting two unramified-subgroup functoriality API items. No T.5 theorem uses that gap.
- Keep function-field tame-kernel finiteness with EllipticKTheory E.5. It needs downstream finite generation and Bloch–Gabber–Kato. R4 now names an additional expansion obligation: injectivity of multiplication by p on K₂ of a characteristic-p field (Weibel III.6.7, p.55, using Artin–Schreier, K₂ Hilbert 90 and rational-function localization). No current supplier node was found. R5's consumer amendment must not mark the Harder proof closed before this input is expanded.
- Apply the recorded stage edges and remove certificate language from T.5 in favor of ArithmeticKTheory N.6. The two proposed T.5 planets raise its total to five; the seven lower-layer nodes add none to an already crowded layer.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.5.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.5.lean`: **exit 0**, with only **23** declaration-uses-`sorry` warnings. Five light definitions, five proved examples, two proved adapters; the remaining theorems are roadmap targets.
- `git diff --check`: passed. JSON/reader inventories, source-excerpt absence, and the suggested-file example/data boundaries checked.

The acceptance covers the corrected planning pass and its honest remaining boundaries. It does not claim formalisation or completion of the routed consumer proofs.
