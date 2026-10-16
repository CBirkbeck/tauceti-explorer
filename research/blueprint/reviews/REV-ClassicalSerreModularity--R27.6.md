# Independent review: Classical Serre Modularity R27.6

**Verdict: accepted as a completed planning pass.** Reviewer: Codex, session `codex-D4qUNO`, job `REV-ClassicalSerreModularity--R27.6`, 16 October 2026. The blueprint was written by a different session, `codex-MjKYHL`.

The seven stages remain **planned**, with five explicit gaps, eight consumer requests and no closed stage. Acceptance does not certify the arithmetic supplier proofs or independence of the modern lifting sources. Their unresolved obligations remain visible in the packet and reader.

## Inventory and coverage

| Item | Reviewed result |
| --- | --- |
| Owned nodes | 9: seven stable refinements and two pre-existing additions in this part |
| Independent node verdicts | 6 corrected, 3 verified; no unverifiable node |
| Nodes added by this review | 0 |
| Retained targets | 22, including two Artin helpers made explicit in the inventory |
| Scoped target inventory | 31 targets: R27.6 has 8; R33.1–R33.6 have 5, 4, 4, 2, 4, 4 |
| Construction APIs | 20 items: 9 good-dihedral insertion, 11 order-three construction |
| Construction tests | 16: 6 insertion, 10 order-three |
| Planets in this packet | 7; assembled per-stage counts are 4, 2, 2, 3, 2, 2, 1, within six |
| Baseline declarations | All 5 independently confirmed; none removed or replaced |
| Primary source versions | 7, with public URLs, precise pagination and SHA-256 values |
| Source issues | All 9 independently confirmed and annotated; no new issue number |
| Suggested file | 111 lines, 5 light definitions, 6 theorem placeholders and 7 proved examples |

At target granularity each stated target is represented by an owned node or an explicit retained target. Two older general-purpose nodes are assembly redirects: eventual weight-one reduction goes to R15.2's H¹ contract, and general infinite-prime weight-one descent goes to ML.1. The finite-image Artin reduction and nonexceptional Katz weight-one helpers stay here. There is no reason to split these proof sketches into individual elementary lemmas.

## Sources and mathematical corrections

Every owned node's source locators and matches were checked. KW I uses the 23-page author preprint, not the Inventiones pagination. DP v2's body and the published transfer, family, Paso and dyadic passages were compared. BCDT uses the 80-page author copy; Skinner–Wiles uses printed p.6, PDF page 3. Wiese and Rohrlich–Tunnell were read at the additional locators recorded in the packet. No inaccessible publisher version is represented as read, and no source passage was copied into these deliverables.

| Node | Source checks and disposition |
| --- | --- |
| Regular compatible-system export | KW I Theorem 10.1(i), p.20; fixed weight, conductor bound, eventual residual irreducibility and coefficient embeddings are retained. Clear fixed denominators before the infinite-prime equality argument. |
| Weight-at-least-two convention | DP Remark 1 and Theorem 1.3, pp.1,3. The R15.5 geometric application assumes invertible level. Add the arbitrary-level analytic lattice branch, using upstream coefficient-field/oldform theory and the saturated q-expansion-integral lattice for algebraic lifting (RT p.301). Finite coefficient detection proves finiteness of this proof-local lattice; saturation preserves the nonzero Hecke congruence. This also covers a weight-one input with level divisible by its residual prime. |
| Lifting input table | DP §§1.2–1.4; SW printed p.6. Preserve all four branches, including the finite-order determinant factor, ordinary trivial quotient at three and nonsolvable dyadic residual image. No mathematical correction was needed. |
| Good-dihedral insertion | DP Paso 2, pp.10–11; KW I Lemma 8.2 and accepted R24/R08 contracts. Correct the consumer's ramification bound to include N. A finite induced model has Frobenius determinant −1; the arithmetic local solution must satisfy the prescribed determinant after an unramified twist. |
| Order-three type | DP Lemma 2.3, pp.12–13, both versions; KW I Theorem 5.1(4), p.10. The displayed lattice identities are correct. Extend the coefficient DVR to contain the input residual coefficients and unramified twist, and reduce modulo the new maximal ideal. Quotient by π is not generally residue-field reduction after a ramified extension. |
| Terminal characteristic five | DP Paso 6, pp.14–15; accepted R25/R21 contracts. The ordinary boundary k=4=3+1 and all-component positive-dimensional abelian-variety realization remain explicit. No correction to the theorem was needed. |
| Characteristic-two closure | DP §3, p.15. Add continuity. Replace the non-existence-producing `R17.6/weight-two-witness` prerequisite by `R17.6/qualitative-residual-modularity`, followed by R33.1's weight shift. Wiese Lemma 3, p.127, and the proof of Theorem 1, p.131, provide the full projective-dihedral contract. |
| Conditional refinement | KW I §§1,3.2,4–6, pp.2–11. First separate odd-characteristic dihedral inputs; their cyclotomic restriction can fail the minimal-lifting hypothesis. Only the remaining branch uses normalized minimal crystalline lifting and untwisting. Remove the documentary R20.6 manifest from proof prerequisites. |
| BCDT specialization | BCDT Theorem B, p.1, and Theorem 2.2.1/proof, pp.17–19. The field is F₅. Cyclotomic determinant plus irreducibility implies the S-type hypotheses; the endpoint does not assert weight two without finite flatness. |

The dyadic supplier correction distinguishes formal contracts rather than declaring DP's qualitative conclusion false. Rohrlich–Tunnell's introduction, p.300, acknowledges qualitative linear-dihedral modularity; their exact-level theorem, p.307, excludes quadratic discriminants congruent to four modulo eight. Wiese's accepted general supplier avoids extending that restricted theorem or assuming trivial determinant for an arbitrary projective-dihedral input.

The source-issue review confirms E3–E9 and E15–E16 at their recorded locators. E4 is a v2 error corrected in DP's published p.11. E5 and E8 persist there. E6 needs the universal odd-ramification obstruction, still an open R15/R07 supplier contract. E7 needs stronger KW minimality or fixed local type. E9 is an omitted refinement argument, not a false theorem. The KW findings are limited to the author copy. Existing inherited findings are references to their owners rather than duplicate issue records. No verbatim excerpt needed removal.

## API, tests and suggested Lean

Add coefficient extension, package-isomorphism characterization and identity/composition transport to the insertion API. The construction makes noncanonical choices, so it has no uniqueness or universal property beyond the stated transport contract. Replace an administrative ownership check by the mathematical determinant test: over F₇, scaling the swap Frobenius by 2 changes its determinant from −1 to 3 while preserving inertia.

Add scalar-extension/reduction compatibility and primitive-root independence to the order-three API. Its new counterexample uses an unramified twist with Frobenius in F₉ outside F₃, then distinguishes maximal-ideal reduction from quotient by π after ramified extension. Existing tests distinguish split and nonsplit inertia, invariant dimensions, monodromy, tame relations and degree versus ramification index. Both constructions have substantially more than three discriminating tests.

The suggested file adds the proved determinant regression. Its five definitions remain real-bodied formulas on existing matrix carriers; the heavy arithmetic objects remain reader targets. No data definition or artificial predicate is filled by a placeholder. Reader API tables, counts, dependencies and coefficient conventions were synchronized; broken TeX delimiters and tab-corrupted `\times` were repaired.

## Baseline, ownership and dependency audit

Read the exact pinned raw sources for `HeckeRing.GL2.Newform`, `HeckeRing.GL2.Newform.qExpansion_coeff_one`, `Matrix`, `Matrix.det` and `Matrix.mulVec`. They agree byte-for-byte with the corresponding shared compilation snapshot. The newform uses positive natural level, integer weight and inherited nebentypus; determinant and vector action use the ordinary commutative-ring matrix conventions. No baseline citation was removed or repaired.

The reviewed library audit and current Tau Ceti searches show no existing global Serre theorem to replace these targets. Current upstream commits match the packet's recorded hashes. ModularForms owns the newform/Hecke/coefficient-field and all-cusp lattice plans. LocalGaloisGroups imports the tame quotient from LocalFieldsRamification; this part requests only its residual-module application. R01, R07, R08, R15, R17, R19, R20, R21, R22, R24, R25 and R32 supply the named arithmetic contracts. Their statements and the RS-06 ownership boundaries were checked; no supplier theory is rebuilt here.

A node-level traversal of the scoped ClassicalSerreModularity graph, with this part's overrides and retained-target assembly redirects, is acyclic for all 31 targets. The modern qualitative endpoint reaches exactly the three early R27.1 good-dihedral/Chebotarev facts and no R26 or R27.2–R27.6 endpoint. The modern strong and elliptic exports additionally reach the conditional R27.6 implication and R27.4 refinement; neither reaches `full-classical-serre-theorem`. The two-routes comparison depends on both endpoints only as a documentary comparison, never as a proof input. Traversal stops at external supplier contracts and broad stage aliases: it is not a proof-closure or source-independence certificate. Tier checks introduce no upward dependency.

Confirmed finding `RT-AREA-langlands-2/8` is respected: R19.1 constructs the Deligne–Serre representation, R17.5 supplies the solvable cases, and R27.6 retains the finite-image odd Artin corollary. ML.1 imports these exports and owns general irregular-system descent. No ML.1-to-R27.6 prerequisite was introduced.

## Validation and orchestrator handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalSerreModularity--R27.6.json`: zero errors and zero warnings, with the existing declaration index.
- `lean-check research/blueprint/suggested/ClassicalSerreModularity--R27.6.lean`: exit 0 at the pinned shared build; only the six expected theorem-placeholder warnings. All seven examples are proved.
- `research/blueprint/intake.py check-files`: deliverable paths/content pass. `git diff --check` passes.

No blocking question remains for this review. Assembly must apply the recorded redirects, including the two retained Artin helpers and the documentary comparison, and preserve the five gaps/eight requests. In particular, the H¹ reduction, full determinant-compatible local solution, odd-ramification flatness obstruction, all-component realization and independent globalisation-source obligations still require their owners. These are the existing next steps, not completed proofs.
