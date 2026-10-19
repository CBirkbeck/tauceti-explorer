# Independent review: rings with symbols and Tate comparisons

**Verdict: accepted.** Reviewer: Codex (GPT-6), session `codex-TtePAf`, issue #10790, job `REV-K2SymbolsBrauer--T.6`. Date: 2026-10-19. The input is the separate `codex-PVxIak` session’s planning pass for #10817. This reviewer did not write that pass.

Acceptance is of a completed target-level planning pass under PROTOCOL §0. Both T.6 and T.7 remain **planned**, with their exact remaining obligations; neither is closed or implemented. The corrections described here are in the packet, reader and representative Lean file. There is no unfinished review work.

| Inventory | Reviewed result |
| --- | --- |
| Targets | 20: 8 verified, 12 corrected, none added |
| Kinds | 14 theorems, 1 definition, 4 constructions, 1 comparison |
| Definition/construction API entries | 26 |
| Discriminating definition/construction tests | 19; at least 3 for each of the 5 objects |
| Planets | 6 in each layer |
| Pinned declarations | 14 checked: 13 original and 1 added import |
| Source files | 9 public PDFs; all downloaded hashes match the packet |
| Source findings | 2 confirmed: the original finding and one added during review, both version-scoped |
| Remaining proof gaps | G1, G2 and G3; retained explicitly |

Each target has a separate verdict and mathematical evidence in `review.checked`. Every implementation status remains `unchecked`.

## Corrections to mathematics and ownership

The cyclic-algebra splitting argument had an actual proof defect. It represented X by the diagonal entries αζⁱ and Y by β times a cyclic shift, where αᵐ=a and βᵐ=b, and then claimed the same matrices were defined over F as soon as α∈F. That need not put β in F. The corrected representation takes Ye_i=e_{i−1} for i>0 and Ye₀=b e_{m−1}. Together with Xe_i=αζⁱe_i, it satisfies Xᵐ=a, Yᵐ=b and YX=ζXY. The distinct diagonal eigenvalues give the diagonal idempotents, and the invertible weighted shift gives every matrix unit. Thus adjoining a root of a alone splits the algebra. The proof and the split API now say this explicitly.

The current Tau Ceti library also contains more of the proposed Kummer/cyclic work than the input acknowledged. Read the actual declarations and surrounding hypotheses in `ClassFieldTheory/Local/Symbol.lean`, `Local/CyclicClass.lean` and `Brauer/Torsion.lean`. They already provide:

- `kummerCupPairing` and its exponent evaluation;
- `h2MuToBr`, its injectivity and its precise torsion image;
- `h2MuToBr_cup_kummerClass`, for arbitrary fields and Kummer degree d dividing m, including d<m.

The last theorem sends the ordered cup (a,b) to the negative cyclic class with the second input defining the extension. Apply it to (b,a), then use cup skew-symmetry to get the positive cyclic class of b over F(a^{1/m}). The revised target imports this theorem instead of planning a second cocycle proof. What remains new is the explicit symbol-algebra adapter: the idempotent corner has degree d, the full algebra is its matrix algebra of size m/d, and the existing QFI crossed-product comparison supplies its Brauer interpretation. The degree-drop and quartic tests remain in place. The coefficient contraction is likewise a tensor transport of the existing pairing, with the root-change law, rather than another coefficient pairing.

The local invariant and generic crossed-product comparison were already correctly imported. Independently read `character_artinMap`, `h2MuEquivZMod`, `toRatAddCircle_h2MuEquivZMod` and `brauerCohomologyEquiv_crossedProductClass`. The invariant coordinate is [k/m]↦k. The positive ordered cup computes the transpose of CA.1’s Artin-first/root-second symbol, so the exponent in the displayed Hilbert comparison is negative. The ℚ₇ cubic computation distinguishes that sign; a quadratic test cannot.

For the Chern comparison, the source’s product formula has hypothesis (M). The revised proof verifies it: two integral K₁ inputs and output cohomological degree two force i=j=k=k′=1, so only one term occurs and its factorial coefficient is −1. Reduction follows the integral product, preserving the restrictions on finite-coefficient products at moduli two and four. The assertion remains confined to the integral-reduction image, with the K₁[m] Bockstein quotient kept separate. The raw Hurewicz sign ε remains a supplier obligation.

## Verification of the remaining mathematics

Read the scanned formulas in Stein–Dennis Proposition 1.1, printed pp.283–285, and van der Kallen §5.2, pp.488–489, against the modern word. Literal substitution gives D(r,s)=P(−r,s), without inversion. Independently checked the two unit formulas and the D2 calculation using H3, H5 and H2: the reversed unit-symbol terms cancel. These are general commutative-ring relations; the cited T.2 unit-symbol identities explicitly apply to commuting units, so no field-only Matsumoto argument is being used over rings with zero divisors.

Read van der Kallen’s rank-one chunk, general-position construction and stability argument through §§5.2–7.4 at the cited locations. The plan distinguishes the rank-two intermediate object from the n≥3 kernel and requires both inverse identities. The semilocal residue-cardinality criterion is exactly the threefold-stability criterion; it does not cover the local small-residue cases recorded in G1.

Checked the augmented-double and relative Steinberg quotient against Weibel and Levine and read the actual U.5 supplier contracts. The cross-commutators are normally generated, without imposing four pairwise-distinct indices. A comparison of relative K₁ and the later exact-sequence terms does not give the relative π₂ comparison or its K₃ boundary. G2 correctly retains that work. The guarded presentation requires I⊆Jac(A) and the D3 guard on the three inputs, as opposed to eligibility only of the output pairs. The forbidden triple in 𝔽₃[x,y]/(x²,y²), I=(xy), has the stated nonzero differential defect.

Checked the differential against all guarded relations, including both D2 eligibility cases and each D3 ideal-input case. Its square-zero inverse uses the abelian tensor presentation with the balanced Leibniz relation; it does not assume a module structure on relative K₂. Independently verified the rational determinant detector’s relation calculations. It supplies a nonzero double-ideal-entry class even with two invertible. For the principal dual-number ideal the D3 symmetry, D1 two-torsion and coefficient-halving argument do kill those classes when two is invertible. The 1971 note’s integral example shows why that hypothesis matters.

Independently exhausted the ℤ/4 detector’s admissible relations: 12 D1 instances, 40 D2 instances and 56 D3 instances. Its upper-bound reduction and nonzero lower-bound value agree. Recomputed the uniform dyadic argument: first reduce to unit symbols, use CA.1’s generators −1 and 5 for n≥3, establish exponent two, and only then kill {−1,5}=2D(−2,2) and {5,5}. Reduction to ℤ/4 gives the matching lower bound. This proof retains G1; finite experiments do not replace the all-local presentation.

Read the 38 external blueprint supplier statements and hypotheses. The arithmetic adapters preserve the distinction between local and number-field theorems, ℓ≠char F locally, the required places in S, the real two-adic case, the separate finite S-integer construction, the Picard kernel of the finite generic-point map, and the residue sign ∂h=−κ∂ᵗᵃᵐᵉ. M.1/M.3/M.8 and CA.1 keep their ownership and their retained gaps.

## Sources and baseline

Downloaded the nine versions identified by URL and SHA-256 in the packet and independently read every cited target location. The scanned 1971 dual-number note and Stein–Dennis formulas were inspected as images. No inaccessible original proof is represented as read. Statements, proof arguments and the review are in our own words; no source passages were added.

Corrected the following locators and matches:

- Levine p.290 has an **unnumbered theorem in §2.1**, attributed to Keune Theorem 15; the input’s “Theorem 2.1 (Keune [18])” was inaccurate. The 1975 split-pair Theorem 2 is on p.935.
- Weibel’s relative definition is III.5.7 on p.40. Exercise III.5.14(a)–(b) is on p.46, with (c) on p.47. The main theorem, corollary and integral Example 1 of the 1971 note are on p.1204, followed by its proof on pp.1205–1207.
- The Galois-cup formula is (III.6.10.2) on p.58 and its symbol-descent proposition is III.6.10.3 on p.59. Cyclic Algebras III.6.9 and Proposition III.6.9.2 are on p.57, and Remark III.6.10.4 is on p.59.
- The former Weibel pp.57–58 citation did not support global Brauer reciprocity. Replaced it with Milne V Example 5.4, p.179, and VII Theorem 8.1(b), p.221, read directly. General reciprocity remains imported from ClassFieldTheory and CA.1.

Confirmed `K2SymbolsBrauer/E-T6-old-symbol-inverse` and added its independent verdict. The explicit word and the ℚ(t) residue 2, versus 1/2 with an extra inverse, decide the finding. Morrow Remark 3.10 uses the parameter change without inversion. The confirmation is limited to the separately paginated author chapter with the recorded hash; no assertion is made about an uncollated bound edition. The author’s errata link returned 404 when checked, and no novelty claim is made.

Added and confirmed `K2SymbolsBrauer/E-T6-cyclic-splitting-minimal-polynomial` after visually checking Lemma III.6.9.1 on p.57. The lemma’s nonscalar condition is too weak to identify F[u] with F[T]/(Tⁿ−1). Over F=ℂ(s,t), let D=(s,t)_F and A=Mat₂(D). The element diag(1,−1) is nonscalar and has fourth power one, but A is a nonsplit degree-four algebra. Independently checked that D is division: over ℂ(s)((t)), a primitive integral zero of its norm a²−sb²−tc²+std² first forces a,b to be t-divisible by reduction and the nonsquareness of s, then forces c,d to be t-divisible after dividing by t and reducing again. This contradicts primitivity. Requiring dim_F F[u]=n repairs the source’s idempotent proof. Both the explicit weighted-shift construction and the imported Kummer/cyclic comparison avoid this false criterion. The second finding has its own confirmed verdict, is scoped only to the hashed chapter and makes no novelty claim; targeted author-site searches found no correction and the linked errata PDF returned 404.

Read all 13 original baseline declarations at the exact packet pins, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These include the unit/Jacobson notions, real square-zero and dual-number carriers, Kähler differentials and universal derivation, primitive-root coordinate equivalence, and native Kummer/cup declarations. Added the independently checked `TauCeti.kummerMap_eq_one_iff` at that Tau Ceti pin; its exact m-th-power characterization makes a proposed second Kummer-kernel theorem unnecessary.

Read the current upstream ClassFieldTheory and QuadraticFormInvariants reader documents and relevant suggested declarations, and searched the nine newer roadmap directories for overlapping targets. LocalGaloisGroups already uses the existing coefficient pairing and is not assigned another such construction. The library audit and actual current library were also checked. The read-only revisions were TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current implementations remain distinguished from the pinned baseline. No Lake command was run in either read-only checkout.

## Lean, coverage and handoff

The suggested file now follows the binding current shape: one `import Mathlib`, the two actually used Tau Ceti imports, the roadmap namespace and layer comments, three real-bodied light definitions, six proved discriminating examples and nine named theorem targets. No example is admitted, and no missing data carrier is replaced by an admitted definition. The reader lists every retained theorem target and its mathematical meaning. Heavy K₂, twist, algebra and Chern targets retain their full specifications in the reader.

Validation passed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.6.json`: 0 errors, 0 warnings.
- `lean-check` on the final 178-line suggested file: exit 0 at the pinned shared build, with exactly 9 warnings, all declaration-uses-`sorry`. Available memory before compilation was 77 GB. No compiler remains running.
- Intake validation for all five deliverables, source-version validation and `git diff --check`: passed.

For follow-up and assembly, preserve **G1** (small-residue nonfield local presentation), **G2** (relative π₂ and K₃-boundary comparison) and **G3** (Keune’s full guarded relative presentation). These are explicit proof obligations allowed by planned coverage under PROTOCOL §0, not hidden completed proofs. Keep the inherited T.2 product-orientation and M.3 hypotheses as well. Reconcile the earlier T.3 packet with the corrected convention and input guard, redirect the local-symbol owner to CA.1, import the existing current Kummer/cyclic APIs, and replace each layer’s old planets with the six selected here. No new roadmap, layer or ownership transfer is required.
