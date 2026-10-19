# Independent review of CMAllPrimeMainConjectures

Reviewer: Codex, session `codex-QkCBWL`; 2026-10-19. Job: REV-DESIGN-CMAllPrimeMainConjectures, issue #1888. The design was written by a different worker, Claude Code, session `claude-dBmbUG`.

**Verdict: needs_changes.** This is a completed independent review. The packet remains a partial plan; this review does not accept it for packaging. Clear corrections have been applied to the packet, roadmap definition and suggested file. Four nodes have not been established at their exact stated strength. The all-prime rational CM endpoint is distinguished throughout from integral equivariant assertions at primes above p.

## Inventory and extent of review

All 54 nodes have individual entries in `review.checked`: 24 verified, 26 corrected, four unverifiable. No nodes were added or deleted. The final packet has three definitions, eight constructions, 31 theorems, four lemmas, six comparisons and two applications. It has 82 API entries, 47 tests, 25 planets, 14 baseline declarations, 25 supplier requests, 13 explicit gaps, six existing restructuring proposals and three confirmed source issues. Each definition or construction has at least three tests. There are seven stages, CZ.0–CZ.6; the internal node dependency graph is acyclic and no internal prerequisite points to a later stage. Planet counts are 6, 2, 4, 3, 2, 5 and 3, respectively.

“Verified” here checks the statement against the cited result and the recorded proof/supplier obligations. It does not mean a formal proof exists or that the packet's explicitly listed gaps have been closed. The remaining gaps in geometric comparison, integrality, nonvanishing and integral Tamagawa theory also affect downstream closure.

## Sources and locators checked

The packet records exact public URLs, editions, hashes, dates and reading locations. Statements, source matches and this review are in the reviewer's own words; no source passage is reproduced.

| Source | Material checked |
| --- | --- |
| [Burungale–Tian, author version v2](https://arxiv.org/pdf/2506.03465v2) | Entire seven-page version, especially §2.1, Theorem 2.1, and §2.2, Theorem 2.6, pp. 3–5. The corrected non-p Euler terms from the extraction are retained. |
| [Kato, Astérisque 295](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | §15, printed pp. 250–267; §3.8, pp. 138–140; §§13.4–13.8, pp. 226–229; Lemma 14.15, pp. 243–244. Inspected page images for the theta norm, reciprocity, normalization and descent formulas, and compared Theorem 6.6, p. 163, with (15.9.2), p. 259, and Lemma 15.11, p. 262. |
| [Johnson-Leung–Kings, v2](https://arxiv.org/pdf/0804.2828v2) | Entire 38-page version, including §§2–3, Lemma 4.3, Theorem 5.2, Corollary 5.3, §6 and regular/singular-prime distinctions in §7. |
| [Rubin, Inventiones 103](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0103/LOG_0009.pdf) | Setting p. 27; Theorem 4.1 and remarks, pp. 36–37; §5 opening, p. 38; proof case table and applications, pp. 58–59. The nonsplit statement is about class groups and global units, with its stated inequality/equality conditions. |
| [Rubin, public Euler systems course draft](https://swc-math.github.io/notes/files/99RubinES.pdf) | Definition II.1.1, pp. 21–22; Theorems II.3.2–II.3.3 and hypotheses, pp. 26–28. This is identified as a course draft, rather than silently treated as the published book. |
| [Rohrlich, Mathematische Annalen 281](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0281/LOG_0061.pdf) | Introduction, Theorems 1–2, pp. 611–612. The central nonvanishing statement supplies the weight-two case; its proof and the infinite-order Hecke edge are not claimed closed. |
| [Agboola–Howard II, v2](https://arxiv.org/pdf/math/0401124v2) | §3, Propositions 3.1 and 3.3 and proofs, pp. 3–5; checked the inert Selmer deduction against Rubin's actual statement. |
| [Castella–Grossi–Lee–Skinner, v2](https://arxiv.org/pdf/2008.02571v2) | §1.2, Definition 1.2.1, Theorem 1.2.2 and proof, pp. 7–8; §2.2, equation (2.11) and Theorem 2.2.3, p. 15. Retained the local character exclusions and branch conventions. |

The inaccessible or unread Yager, de Shalit, Ribet, Huber–Kings, Itakura and KK3 inputs remain identified as such. No unchecked book is used to certify an assertion.

## Corrections made

Node names below omit the common `CMAllPrimeMainConjectures:` prefix. The packet's individual review entries identify all remaining verified nodes.

### Foundations and elliptic units

- **CZ.0/ray-tower-iwasawa-algebra:** import the generic completed group algebra and its map/projection API from current Tau Ceti, via ProfiniteProPGroups Layer 9. The remaining PMIA L1 request concerns the two-variable presentation and coefficient extension, including finite groups of p-divisible order. It does not reconstruct the existing generic object.
- **CZ.0/ray-tower-iwasawa-cohomology:** remove arbitrary-coefficient perfectness and unrestricted derived j_* comparison. Perfectness is restricted to Johnson-Leung–Kings Lemma 4.3's specified finite-character and equivariant complexes. Selmer L3's degree-one comparison and odd-p cyclotomic rank theorem do not prove the all-p ray-tower assertions. Added coefficient-map functoriality and fixed the inverse twist convention.
- **CZ.0/tower-unit-class-modules:** replace finite S-unit p-completions by finitely generated compact modules. Replace a nonexistent canonical finite-level-to-limit roots-of-unity map by the assertion about norm-compatible inverse-limit roots. Add inverse-limit constructor and extensionality interfaces.
- **CZ.0/tower-kummer-identification:** use compatible finite-level Kummer isomorphisms and their inverse limit; the limit of these isomorphisms needs no additional exactness assertion.
- **CZ.0/tower-unit-module-structure:** delete the false proof of R-torsion-freeness from absence of Z_p-torsion, and the use of a cyclotomic Euler-rank formula in a Z_p² tower. Record the missing R-torsion lemma, all-p rank formula and j_* limit comparison. The node remains unverifiable.
- **CZ.0/theta-eisenstein-kronecker:** restrict formulas to arguments outside the lattice and logarithmic derivatives away from theta divisors. Correct the reading locator to Kato §3.8, pp. 138–140.
- **CZ.0/cm-theta-function:** add O_K-linearity and degree coprime to N(a) to the isogeny norm. For existence, account for the Pic⁰ obstruction by the sum of the odd-order a-torsion subgroup; degree zero alone does not show a divisor is principal. For uniqueness, use both multiplication-by-2 and multiplication-by-3 norm constraints. A nontrivial cubic root of unity passes the first constraint, so the original constant-multiple test was too strong. Add the quotient-isogeny counterexample below.
- **CZ.0/standard-elliptic-unit:** state f-unit integrality as zero valuations away from f, with the two-prime global-unit case separate. Replace the tautological a=b test by distinct auxiliary ideals (5) and (7), giving different auxiliary factors. Replace an unconditional inequality of Euler factors by the norm identity that actually distinguishes a wrong definition. Record the missing vertical-integrality proof.
- **CZ.0/elliptic-unit-module:** remove the unsupported height-one-pole example: the auxiliary ideal becomes the unit ideal in the relevant height-one localizations. Keep the total-quotient-ring construction and replace the test by its auxiliary-factor identity.
- **CZ.0/elliptic-unit-cotorsion** and **CZ.2/elliptic-zeta-element-comparison:** add the exact logarithmic-regulator kernel input `NumberField.Units.mem_torsion`; a nonzero numerical regulator alone does not identify that kernel.

### Realizations, reciprocity and integral main conjectures

- **CZ.1/cm-hecke-realization:** identify geometric étale–de Rham comparison, its CM tensor compatibilities and semilinear descent as a missing input. Selmer L4/period-realization defines the period-ring realization, rather than supplying this geometric comparison. The request now states precisely Kato (15.8.1), including its filtered range.
- **CZ.1/cm-p-divisible-reciprocity:** distinguish relative O_𝔭-height one from ordinary p-height [K_𝔭:Q_p], which is two at inert and ramified primes. Correct θ_n(z) to aθ(z−ν_n) and make evaluation at ξ_m explicit. KK3 remains an unread general-reciprocity input.
- **CZ.1/cm-elliptic-reciprocity:** correct an inconsistent acceptance occurrence to the conjugate Hecke character, agreeing with Kato Proposition 15.9 and (15.9.2), pp. 258–259.
- **CZ.2/elliptic-unit-euler-system:** use the integral character quotient; an idempotent projection requires the finite group order to be invertible.
- **CZ.2/tamagawa-s0-abelian** and **CZ.2/lambda-main-conjecture:** replace the deleted NoncommutativeAndEquivariantIwasawa determinant-functor node by a precise request to PMIA L5 for determinant lines, perfect-complex base change and the Div/length interface. The removal's proposed K-theory redirect does not provide this statement. Add Mathlib's precise analytic class-number limit, without claiming it proves the integral determinant comparison. Preserve the Huber–Kings/Itakura gaps.
- **CZ.2/rubin-iwasawa-modules:** require finite-level class field theory followed by compact inverse limits. A cyclotomic-plus unit/class sequence is not by itself the ray-tower supplier. Keep Rubin's p∤[K₀:K] and p∤#μ(H) hypotheses.

### Coleman/Katz scope

- **CZ.3/two-variable-coleman-map:** mark the strong integral construction, injectivity and cokernel assertions explicitly unverified. A map from unextended U_∞ into Ô[[G]] is not an isomorphism after extending coefficients unless the source is extended too. Add a requested interpolation-uniqueness API, whose exact hypotheses remain part of this gap.
- **CZ.3/elliptic-units-to-katz-measure:** distinguish equality of image modules from equality of characteristic ideals. Rubin's remark and CGLS do not certify the stronger image statement. Add the reciprocity node actually used by the moment calculation, and its CZ.1 stage dependency.
- **CZ.3/katz-form-main-conjecture:** remove the proof by arbitrary one-variable projection. Rubin's Remark (1), p. 37, covers two variables and the Z_p-extension unramified outside 𝔭. Anticyclotomic projection requires a control theorem with Tor/local corrections and nonvanishing. The broader statement is explicitly an unverified target.
- **CZ.3/katz-functional-equation-lambda:** CGLS (2.11), p. 15, does state the λ-equality, but its derivation requires the exact functional equation and the contribution of extra factors. Record that proof obligation instead of treating the unspecified factors as units.

### CM descent and Kato normalization

- **CZ.5/cm-induction-normalization:** retain the scalar-normalized de Rham identification and absolute irreducibility; distinguish the Galois map (15.11.2) from the archimedean map (15.11.3). Correct the paragraph locator following Lemma 15.11 to p. 263. Add the missing theta-series modularity and exact-level input to the characterization gaps.
- **CZ.5/cm-comparison-map:** replace the zero-map test by finite-level corestriction compatibility. The map is induced by (15.11.2), with the correct contained-field G′_∞ target.
- **CZ.5/twisted-tower-cohomology:** with natural left deck action, untwisted-to-twisted φ_χ is Tw_{χ⁻¹}-semilinear; its inverse is Tw_χ-semilinear. Freeness inherits the explicit ray-tower gap.
- **CZ.6/cm-coefficient-reciprocity:** require f to be the exact conductor, replace the incomplete coefficient-field expression by the compositum KQ(ζ_{pⁿ}) or the finite étale algebra K⊗Q(ζ_{pⁿ}), and Tate-twist (15.12.1) by (1) before applying exp*. This matches (15.12.2), p. 263.
- **CZ.6/twisted-equivariant-equality:** fix transport of support to Tw_χ(q′) and the twisted inertia annihilator χ(g)⁻¹g−1. Use nontrivial conductor inertia and its trivial cyclotomic image to remove Euler terms at these primes.
- **CZ.6/cm-zeta-bridge:** add twist nonvanishing as a prerequisite and require the finite-level exponential injectivity on a dense character family used in Kato §§13–15. Equal exponential images alone do not prove equality of global classes. The bridge is rational.
- **CZ.6/equality-descent:** spell out the rank-one UFD argument: after normalizing the zeta generator, A⊂H⊂Frac(A), H_(a)=A_(a); if ah∈A then h∈a⁻¹A∩A_(a)=A. This proves (H/A)[a]=0, enabling the stated cancellation of the H²[a] term. Here A_(a) denotes localization at the prime (a).
- **CZ.6/cm-kato-divisibility:** remove unsupported transport of integral lattices through the period normalization. The corrected Z(f)-form divisibility is at height-one primes not containing p, and follows from the rational all-prime endpoint. It makes no singular-prime integral claim.

The roadmap's stage descriptions, supplier lists and embedded introduction now reflect these restrictions. CZ.5 owns (15.11.2), the comparison map and descent; CZ.6 owns (15.11.3), coefficient reciprocity and the rational Kato endpoint. The suggested Lean file's comments now state the inverse twist orientation and remove the false claim that evaluation at a character of an arbitrary coefficient ring has prime kernel or a specified height. No new heavy carrier or sorry-bodied data definition was introduced.

## Baseline and current upstream

Every final baseline entry's statement was read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; the packet retains Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` and cites no unverified declaration there. The confirmed Mathlib entries are:

- `Module.length`, `Ideal.height`, `IsLocalization.AtPrime`;
- `MonoidAlgebra`, `PowerSeries`, `ClassGroup`;
- `NumberField.Units.regulator`, `NumberField.Units.regulator_ne_zero`, `NumberField.Units.torsion`;
- `IsCyclotomicExtension`, `cyclotomicCharacter`, `NumberField.IsTotallyComplex`;
- added `NumberField.Units.mem_torsion` and `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (including the latter's residue definition).

The corrected baseline descriptions distinguish the torsion subgroup from the full unit group, numerical regulator nonvanishing from its kernel theorem, and the cyclotomic character on a field containing all p-power roots from its further descent/continuous completed-algebra extension. Module paths and precise provided statements are in `baseline.declarations`. No baseline entry was deleted; two were added and three descriptions narrowed.

I also read the reviewed library audit, current TauCetiRoadmap suppliers and current Tau Ceti statements. Current completedGroupAlgebra/proj/ext/of/map and map functoriality are imported, as are current Hecke-character carriers and the algebraicity predicate through GlobalNumberFields Layers 9–10. ClassFieldTheory already states inverse-Artin cyclotomic normalization with the norm. These observations are recorded in `upstreamNotes`; newer declarations are not falsely certified at the older pins. No upstream file was edited. No duplicate generic carrier is planned here.

## Source issues

All three entries now have confirmed independent-review verdicts, with locators and version checks in the packet:

1. **E1:** Kato's Proposition 15.17 proof, p. 265, points to Lemma 14.12 where the required module-length result is Lemma 14.15, pp. 243–244. This is a cross-reference error.
2. **E2:** the proof of Lemma 15.11(2), p. 262, uses the unconjugated Hecke character/form where (15.9.2), p. 259, and Theorem 6.6, p. 163, give the conjugate character and f*. Their L-functions agree, so the argument survives this correction.
3. **E3, added here:** the isogeny assertion (15.4.2), p. 252, needs degree coprime to N(a). For the O_K-linear quotient q:E→E/E[a], pushforward of the theta divisor N(a)[0]−[E[a]] is zero. Its norm is therefore constant, while the target a-theta divisor is nonzero when N(a)>1. Thus the printed unrestricted assertion fails. This counterexample also gives a negative unit test. A search for a correction of this assertion found no corrigendum; the checked version is the published Numdam scan.

## Remaining work and orchestrator decisions

The four unverifiable nodes are **CZ.0/tower-unit-module-structure** and **CZ.3/two-variable-coleman-map**, **elliptic-units-to-katz-measure**, **katz-form-main-conjecture**. These need substantive input rather than editorial repair. The 13 gaps spell out all remaining obligations: integral Tamagawa at s=0; KK3 relative height-one reciprocity; general-weight CM induction; Ribet's self-twist converse; Rohrlich/Hecke nonvanishing; the original Coleman/Katz primary-source gap; p-divisible class-number comparison; ray-tower comparison/rank/torsion; geometric de Rham comparison; exact Coleman source/scalar extension; one-variable control and functional-equation factors; theta-series exact level; and arithmetic integrality of theta values.

The next revision should first establish the ray-tower structure lemmas and replace the speculative Coleman/Katz interfaces by exact primary-source statements, or narrow CZ.3 to verified assertions. Sources not available under the library rules require a cleared primary source or a public replacement; a secondary attribution alone cannot settle the exact integral map and image.

The six existing restructuring proposals remain proposals for the maintainer, concerning KatoEulerSystems, the early elliptic-unit suppliers, CM.4 normalization ownership, Heegner/BSD consumers, CMRankZeroConverse and the inert main conjecture. In particular, do not redirect KatoEulerSystems L4 to a CZ.6 node importing its own zeta construction, and do not export the nonsplit Rubin result as a torsion local-unit equality. The removed determinant supplier also needs the precise PMIA L5 contract, rather than a blind K-theory redirect. Global cross-roadmap closure is not claimed while these supplier obligations remain open.

The standalone reader `research/blueprint/readmes/CMAllPrimeMainConjectures.md` is outside this issue's deliverable paths and was not edited. The orchestrator should include it in the revision so it receives the corrected statements and hypotheses. The authorized roadmap JSON's embedded introduction has review qualifications, but is not a substitute for that reader revision.

## Validation

- Indexed `scripts/check_blueprint.py` against the baseline declaration index: **0 errors, 0 warnings**.
- Source-issue schema and source-version checks: **no errors**.
- Complete review coverage, unique node IDs, internal dependency order/acyclicity, definition/construction test counts, planet bounds and absence of source-excerpt fields checked.
- `lean-check research/blueprint/suggested/CMAllPrimeMainConjectures.lean`: **exit 0**, with five `sorry` warnings and no other warnings. Compilation used the shared pinned build after checking available memory. The 135-line file states light finite-level forms; it does not formalize the main conjectures.
- Final submission-file, sorry-data and whitespace checks are recorded in the handoff.
