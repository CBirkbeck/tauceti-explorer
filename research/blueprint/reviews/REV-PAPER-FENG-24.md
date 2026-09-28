# Review: PAPER-FENG-24 (Feng, Smith theory and cyclic base change functoriality)

Job `REV-PAPER-FENG-24` (issue #1355), by Claude Code, session `cc-39fac3`, 28 September 2026.

- **Extraction:** written by session `cc-7b31c4` (#1354, merged as #1970).
- **Verdict: accept**, after the corrections below, which were made in place. All four routes are accepted.
- **Disclosure:** the same reviewer reviewed PAPER-TREUMANN-VENKATESH-16. That paper's proposed Part II, SmithTheoryAndModPFunctoriality, overlaps routes 1 and 3 here, and the ownership decisions below involve it.

## What was read

- **The published version**, Forum Math. Pi 12 (2024), e1, 66 pp. (doi 10.1017/fmp.2023.32; open access on Cambridge Core), which is what the locators follow.
  - Cambridge Core serves a per-download PDF, so its hash varies between downloads.
  - The article page lists no erratum or corrigendum.
- **The arXiv v6 TeX source** (arXiv:2009.14236, 29 November 2023, the latest version; source archive sha256 9b813ef6…).
  - Its text agrees with print for every finding below.
  - Its numbering agrees statement by statement.
- **Method:**
  - Five checkers took one range each: §§1–2; §3 with the library items; §4 with Appendix A; §5 with Appendix B; §6.
  - They checked every item against the text, and every formula relied on against a page image.
  - Every library citation was checked at the pinned commits (Mathlib 082e2d3, Tau Ceti f790474). Every planned citation was checked against the stage's description in `data/atlas.json`.
- **Independent checks by the coordinator:**
  - the Lemma 3.8 counterexample;
  - the printed form of (2.3) and the missing hypothesis of Theorem 1.1, both in the TeX;
  - the r = 0 counterexample to Proposition 6.3;
  - that §6.2.1 allows any H, so that the SL_1(D) example applies.
- **Adversarial check:** a separate agent tried to refute the two §4 errors (Lemmas 4.16 and 4.24) from the paper's own definitions. It could not, and it sharpened both.

## Changes made to the extraction

- **Statements:** 55 corrected. The original is kept in `originalStatement`, and the reason in `review`. The main kinds:
  - The standing hypotheses were omitted in most of §§3–6. These are: base field of characteristic ≠ p, admissible σ-action, bounded dimension, p odd and good for Ĝ, and the base change setup.
  - Some statements copied misprints of the paper. Examples: (2.3) in item 12; D^b(Y;Λ[σ]) for D^b_σ(Y;Λ) in items 22–23; I and J swapped in fusion, item 56.
  - Some statements are false as printed: items 15, 24, 45, 51, 75 and 76. See the source issues below.
  - Item 104 did not state Lemma B.5 at all; it paraphrased the proof of Proposition 5.6.
- **Locators:** 15 corrected. The Notation is §1.5, not §1.6; equation (3.6), not (3.11); and so on.
- **Statuses:** 15 changed.

  | Item(s) | Change | Reason |
  | --- | --- | --- |
  | 8, 11, 12, 13, 14, 53, 104 | planned → missing, to route 2 | The cited layers are written for characteristic-zero ℓ-adic coefficients (GS.1, GS.4, GS.5) or for the B_dR^+ Grassmannian (GeometricSatakeAndFusion:GS4). ES0 plans operators, not the presented algebra. Nothing defines homomorphisms of L-groups in general. The local-Weil-group cases are planned by LanglandsParameterStacks:LP2 (excursion-presentation, semisimple-characters), and route 2 imports them. |
  | 96 | planned → missing, to route 1 | GeometricSatakeAndFusion:GS1 plans hyperbolic localisation only for the B_dR^+ Grassmannian. |
  | 107 | library → missing, to route 1 | `Module.free_of_flat_of_isLocalRing` needs `Module.Finite`, but the paper needs arbitrary flat k[σ]-modules (Stacks 051E). |
  | 93 | missing → planned | By SmoothRepresentationsOfLocalGroups:SR.6 (Dat–Helm–Kurinczuk–Moss); route 3 imports it. |
  | 10 | layers corrected | Now LanglandsParameterStacks:LP0, LP2:semisimple-characters and GS.5; ES0 does not define L-parameters. |
  | 70 | layers corrected, and split | Now SR.1 and ExcursionOperatorsAndSpectralAction:ES0; SR.3 is complex. The mod p Bernstein centre as an inverse limit is split off as a new missing item for route 3. |
  | 65, 66, 68 | moved from route 2 to route 1 | The Tate diagonal and the Frobenius twist of algebras. |

- **Status checks:** every other status was checked. Where the check found something to add, it is recorded in the item's note, for example:
  - item 7: RG2.5 is local only, but the construction does not depend on the field;
  - item 73: the Moy–Prasad filtration in this generality is planned only if the Fintzen source route is widened;
  - items 105–106: library confirmed.
- **New items (35):**
  - 31 missing:
    - 18 to route 1: parity sheaves on Gr, the integral Tate category, modular reduction, tilting modules, additivity of Psm∘Nm, equivariantization, the torus base change and others;
    - 6 to route 2: the semisimplicity of φ_BC∘ρ, the Exc^σ-action on Tate cohomology, the norm operations on representations, HN compatibility with the diagonal map, Lafforgue's S_{W,v} and the mod p excursion action;
    - 7 to route 3: tame Galois descent of Moy–Prasad filtrations, depth, Schur's lemma, simple Hecke modules, Remark 6.2's faithfulness, Genestier–Lafforgue equivariance and the mod p Bernstein centre.
  - 3 planned, in the source route: FWeil (GS.4), the ker¹ decomposition (GS.0) and HN truncations at deep level (GS.2).
  - 1 library: `Algebra.IsInvariant.isIntegral`, `Algebra.IsIntegral.finite`, `fg_of_fg_of_fg` and `Submodule.exists_sub_one_mem_and_smul_eq_zero_of_fg_of_le_smul`, used in the proof of Theorem 6.26.
- **Routes:** each of routes 1–3 has a corrections paragraph in its brief, and route 4 in its reason.
  - Route 3's open clause ("whichever design job runs first owns those statements") is replaced by a decision, since PROTOCOL §15 requires one owner. SmithTheoryAndModPFunctoriality owns the Brauer homomorphism, plain subgroups, linkage and the Treumann–Venkatesh conjecture, because it states them for any automorphism of order p. Route 3 imports them.
  - In the other direction, route 1 owns the Tate diagonal and the Frobenius twist of algebras, in Feng's general form, and both Part IIs import them.
- **Summary:** it said the atlas already has "the excursion algebra with its relations and the reconstruction of semisimple L-parameters". That is not true with k-coefficients, and a review paragraph now says so.

## Mistakes in the paper (`sourceIssues`)

- **E1–E7** are confirmed. Their kinds, effects and corrections are right.
- **E8–E57** are new: 33 misprints that affect nothing, and the 17 findings below.

### Stated results

- **E8 (misprint, a stated result):** Proposition 2.4's formula (2.3) has the Galois tuple in the wrong form. It contradicts relations (ii)–(iii). The correct formula is ν(S_{{0,…,n},f,(γ_0,…,γ_n)}) = f(ρ_ν(γ_0),…,ρ_ν(γ_n)).
- **E9 (gap, a stated result):** Theorem 1.1 and the abstract state existence of local base change for every p. The only proof, Theorem 6.26, assumes p is an odd good prime for Ĝ.
- **E10 (error, a stated result):** Lemma 2.7 says φ^* sends ρ to φ∘ρ. It sends ρ to (φ∘ρ)^ss.
  - Counterexample: Sym^p on a ρ with image SL_2(F_p), inside PGL_{p+1}.
- **E17 (error, a stated result):** Lemma 3.8 fails without bounded dimension. On Y = ⊔_n A^n with σ(x) = ζx, the cone is unbounded. Every application is to varieties.
- **E25 (error, a stated result):** Lemma 4.16 is false for the σ-equivariant categories it names.
  - At a σ-fixed point, Hom_{O[σ]}(O, I) = 0 while its reduction is nonzero, so reduction is not full. For p ≥ 5 it is not essentially surjective either (Heller–Reiner).
  - The non-equivariant form is true, and is all §4.6.3 needs.
- **E29 (error, a stated result):** Lemma 4.24's right face holds on objects but not as a natural isomorphism.
  - L drops the components of index i ≠ 0 in (4.2) that reduction mod p keeps. Counterexample: GL_2, Gr^{(1,0)} ≅ P^1.
  - The proof's Verdier-quotient step needs T^*ε^* to be full, and it is not.
  - Proposition 5.12(i) cites the back face as a natural isomorphism, so it inherits a gap.
- **E48 (error, a stated result):** Proposition 6.3 and Corollary 6.4 are false at r = 0.
  - Counterexample: H = SL_2, E_v/F_v totally ramified, x = [O_E ⊕ ϖ_E O_E]. Then t and t^{-1} are K_0-conjugate but not U_0-conjugate.
  - The r > 0 argument works at any Galois-fixed point.

- **E12 (error, affects nothing):** the isomorphism (2.1) between ^LG^alg and ^LG^geom is multiplicative only for a lift χ̃ whose values are fixed by act^alg, such as 2ρ̂∘ε. An arbitrary lift fails for U_3. The paper uses only square-root lifts.

### Gaps in proofs

- **E11:** Theorems 1.2, 1.4 and 1.6 conclude an isomorphism of parameters from an equality of excursion characters. That needs φ_BC∘ρ to be semisimple.
  - It is true: ρ(Γ_E) is normal in ρ(Γ), so it is completely reducible by Bate–Martin–Röhrle, and Levis can be transported between the factors.
  - It is now a route 2 item.
- **E26:** the filtration argument in the proof of Lemma 4.14 fails, because Nm is not additive and i^* is not t-exact. The case §4.6.3 uses needs no filtration.
- **E27:** that L∘Psm∘Nm factors through reduction mod p needs Psm∘Nm to be additive and Frobenius-semilinear on morphisms, which is a categorical Tate diagonal. Supplied as a new item.
- **E34:** §A.4 gets Theorem 4.20 objectwise, and after restriction to the torus, from the faithfulness of restriction on tiltings. Restriction is not full, so this does not give a natural isomorphism over Ĥ. The step is not supplied; see the verdict below.
- **E41:** Theorem 5.13's proof identifies the α-summand with all of T^0 and concludes only for all of H^0_c(Sht_G;1). Running the argument on the σ-stable φ_*(α)-component, with Lemma 5.7, repairs it.
- **E46:** Lemma B.4 gives stability of 𝔐^μ only under nonnegative powers of partial Frobenius. The inverses come from Lemma B.3's relation, whose constant term is the invertible Hecke operator of det W. The monotonicity in μ, which the proof assumes, is not needed.
- **E49:** §6.2.3 needs a Galois-fixed special vertex of B(G/F_v), which need not exist.
  - Example: H = SL_1(D) with E_v unramified of degree p, where the fixed locus is a barycentre.
  - Repair: take x ∈ B(H/F_v) and r > 0.
- **E50:** the proof of Theorem 6.26 uses Corollary 6.14 at a point x that need not be special, although footnote 13 says Corollary 6.4 is unavailable there. The repair of E48 and E49 closes this.
- **E51:** "If r = 0, then the result is classical": no argument or reference is given. Theorem 1.1 needs only r > 0.

### Effect

- Theorems 1.2, 1.4 and 1.6, and Theorem 1.1 for p an odd good prime, stand with the repairs recorded above (E11, E41, E46, E48–E50).
- Theorem 6.26 stands for r > 0.
- Theorem 4.20 holds objectwise. As the natural isomorphism that Proposition 5.12 uses, it rests on the step missing in E34, and Proposition 5.12(i) also rests on E29.

## Route verdicts

- **Route 1** (new, SheafTheoreticSmithTheory, 63 items): accept.
- **Route 2** (Part II of GlobalShtukasAndFunctionFieldLanglands, ShtukaTateCohomologyAndGlobalBaseChange, 33 items): accept. The source route had under-routed the modular side, and seven items moved here.
- **Route 3** (Part II of SmoothRepresentationsOfLocalGroups, ModPBernsteinCentersAndLocalBaseChange, 32 items): accept, with ownership against SmithTheoryAndModPFunctoriality settled.
- **Route 4** (source for GlobalShtukasAndFunctionFieldLanglands, now GS.0, GS.1, GS.2, GS.4 and GS.5; 6 items): accept, for the coefficient-independent geometry only.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-FENG-24.result.json` reports no errors.
- `python3 research/blueprint/intake.py check-files` reports no problems on the changed files.
- Every missing item is routed exactly once, and every stage id cited exists in the atlas.
- No Lean file is part of this job.
