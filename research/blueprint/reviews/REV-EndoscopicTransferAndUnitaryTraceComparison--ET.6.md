# Independent review of ET.6

Issue [#9764](https://github.com/CBirkbeck/tauceti-explorer/issues/9764).
Reviewer: Codex, session `codex-m93qgM`, 14 October 2026. The original plan was
written by Codex session `codex-kCEWcW`, issue #9760, PR #9809. This review is
independent of that work.

**Verdict: accepted after corrections.** All 33 node statements and source
locators, direct prerequisites, proof requirements, APIs, tests and planets
were checked. The acceptance is of a complete target-level planning pass.
ET.6 remains **planned**, with five explicit primary-proof gaps and precise
supplier extensions; it is neither closed nor implemented. No unresolved
contradiction is concealed by the verdict.

| Item | Reviewed result |
| --- | --- |
| Nodes | 33: 13 corrected, 20 verified, 0 added, 0 unverifiable |
| Definitions/constructions | 10, each with three discriminating tests |
| API items / unit tests / planets | 45 / 30 / 6 |
| Pinned declarations | 4 confirmed; none removed or replaced |
| Supplier requests | 28, previously 26 |
| Primary-proof gaps | 5, retained and sharpened |
| Restructuring proposals | 5, previously 4 |
| Source findings | 5 confirmed, including 3 added during review |

The packet contains the individual verdicts. The reader was updated in place
with every changed statement, hypothesis, proof step, API item, test, source
match, request, gap and ownership proposal. No node was split merely to turn a
proof step into a target.

## Corrections made

- **Drinfeld levels and Dieudonné variance.** A height-one level with every
  section zero fails on the characteristic-zero generic fibre, but passes on
  the connected geometric special fibre, where the divisor has multiplicity
  q^m. The test now distinguishes these fibres. Transport from a Dieudonné
  representative requires a chosen integral conjugator; it is not independent
  of automorphisms. Scholze's §4 uses the contravariant functor, with
  F=β⁻¹σ₀, and a rank-one O_A^op/p freeness condition. The norm is an integral
  conjugacy class, while the ordered product comparison is an equality of
  characteristic polynomials, not a canonical representative. The basic norm
  inversion and its valuation component are explicit.
- **Type separation and density.** Scholze Lemma 3.1, p.9, separates a
  generalized Speh representation from tempered representations outside the
  indicated induced supercuspidal family. Its function vanishes on all
  square-integrables. The former essentially-square-integrable isolation
  description was reversed. The corrected proof requirements include constant
  terms, the alternating Speh relation and Kazhdan trace density, separately
  from the Bernstein-centre scalar calculation. The supercuspidal has rank d
  when n=dt; the printed indices are recorded as source finding E-ET6-5.
- **Positive Weil traces.** Substituting π_w=π∨⊗χ into Corollary 10.1, p.26,
  gives rec_un(π)=a⁻¹W⊗χ_sim⊗χ. With u=χ(ϖ), the left trace acquires u⁻ʳ
  and the compact trace is unchanged. The dual and inverse twists in the
  author-copy proof of Corollary 10.3, p.27, therefore cannot be used. The
  effective representation is sign(a)W with the indicated positive twists.
  This correction uses the trace identity directly, without a later duality
  theorem; E-ET6-3 records the proof error.
- **Tower multiplicity.** With M(ρ)=Hom_D×(ρ,c-Ind[RΨ]), the proof integral
  on p.29 projects to M(ρ), although Corollary 11.3 labels it M(ρ∨). The
  corrected statement is M(ρ)=(−1)^(n−1)π∨|_K⊗rec_un(π), π=JL(ρ).
  The h∨ accounts separately for π∨. A finite cyclic character of order
  greater than two distinguishes the two projectors. The subsequent
  integrality argument uses this same multiplicity. This is E-ET6-4.
- **Restricted global extraction.** Globalize Π∨ and use the effective
  sign(a)W⊗χ_ψ, rather than repeating the incompatible dual formula.
  Theorem 10.6, pp.27–28, uses a real quadratic R disjoint from F, split at
  the rational prime below x, with the specified completion matching K at
  the prime below v. This makes the new place split over F₀R and preserves
  F_v. The old imaginary-quadratic description was incorrect.
- **Deformation and PEL owners.** R07.3 is Fontaine–Laffaille theory, not the
  strict-O deformation theorem. R07.1–R07.2 supply the underlying objects;
  a FiniteFlatGroups Part II must supply strict-O deformation, Drinfeld levels
  and algebraization. A second new request makes the relative/opposite-algebra
  adapter on R07.2 objects explicit. PEL M2/M4 good-prime results do not
  establish the arbitrary ramified auxiliary models needed here. Their
  instantiation and Serre–Tate comparison remain exact supplier requirements.
- **Global and archimedean suppliers.** Current ClassFieldTheory explicitly
  excludes global Weil groups. The potential-abelian argument now requests
  their localization and algebraic realization from its Part II through
  R01.1, importing existing Hecke characters from GlobalNumberFields.
  The additional AF.1 archimedean request exposes the infinite-place input;
  AF.1 and AF.5 have needs_changes reviews and are not accepted suppliers.
- **Other contracts and locators.** The Arthur–Clozel request separates
  tempered twisted character identities from extension by Langlands quotients:
  its I §6, p.60, excludes the asserted general non-tempered identity.
  The newvector epsilon exponent is the coefficient of q⁻ˢ. Henniart's
  Theorem 1.8 is on p.591 and its corollary on p.592; Badulescu's Q
  definition is on p.24 and Proposition 3.9 on p.25. References to Scholze
  11.3 now correctly say Corollary. Source-version kinds use the prescribed
  `author copy` value.

## Baseline, suppliers and closure

At Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**, the full definitions
of Matrix.diagonal (Data/Matrix/Diagonal), Matrix.trace and the statement of
Matrix.trace_diagonal (LinearAlgebra/Matrix/Trace), and Matrix.charpoly
(LinearAlgebra/Matrix/Charpoly/Basic) were read. They provide exactly the
finite-matrix operations needed by the suggested projection. Tau Ceti's pin is
**f790474821cf4256814db967cb154e7af3d0c369**. No baseline citation required
replacement, and no missing near-match was passed off as implemented theory.

The accepted AUDIT-32 result reports the five ET.6 families absent; its review
has not yet been integrated into data/library-coverage.json. The current
TauCetiRoadmap tree at **0d144d044dacebca17b654695b6f1ad58f159b27** and current
Tau Ceti at **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039** were checked read-only.
The imports retain SR.5.3's segment classifications, R01.2's WD objects and
operations, R01.3's conductors, ClassFieldTheory's local conventions,
GlobalNumberFields' Hecke characters and InductionRestriction's finite-group
Clifford/Brauer theory. Requested Weil and global adapters are stronger than
those existing finite-group/local statements and remain explicit.

The five gaps concern Harris–Taylor's restricted globalization proofs, the
DKV all-inner-form JL and Jacquet proofs, Henniart's primary highly ramified
stability proof, the nongeneric JPSS factor proof and the primary
Schneider–Zink/Kazhdan type-density proofs. The first two books are not in the
cleared library. Public restatements were checked without claiming to have
read the inaccessible proofs. AL.3's generic product theorem does not close
the nongeneric gap. The current Langlands quotient, special-block tensor,
Euler shift, conductor and inner-form nontransfer distinctions are consistent
with the imported conventions; no general conjectural Badulescu compatibility
is promoted to a theorem.

Both confirmed red-team findings were checked against their result and review:
RT-AREA-langlands-1/1 requires early ET.4b before ET.6 and ET.7a;
RT-AREA-langlands-1/15 requires the character Part II, including its twisted
version, after SR.3/ET.1/RG2.0 and supplying ET.4/ET.6. Neither direction is
reversed. Current ET.4 is needs_changes; its coarse ET.6 exports are to be
superseded at assembly using the original planning handoff's alias table.
No other packet or upstream roadmap was edited.

## Sources and their findings

The seven public source records retain URLs, version receipts, hashes and
precise locators. The independently checked passages include Scholze's local
construction and §§2–14 proof interfaces, the deformation and auxiliary
point-count comparisons, Arthur–Clozel's local lifting and global cyclic
statements, Henniart's special-block and quotient-factor construction,
Badulescu's transfer/quotient proofs, and the original and corrected
newvector arguments. Independent global proofs imported from other roadmaps
are not claimed fully checked here. No passages were copied into these files.

E-ET6-1 (q rather than p in Scholze Lemma 6.1, p.15) and E-ET6-2 (the known
1981 essential-vector ideal gap, repaired by Jacquet 2012, Remark 1 p.523)
are confirmed. E-ET6-3, E-ET6-4 and E-ET6-5 are the additional findings above.
Every entry has its own independent verdict and reason. Findings about Scholze
are restricted to the hashed **7 October 2010 author copy**; the publication
page and arXiv version record yielded no correction, and the inaccessible
2013 published text was not collated.

## Validation and questions for assembly

- Pinned-baseline `check_blueprint.py`: **0 errors, 0 warnings**.
- `check_sorry_data.py`: passed. The unchanged 72-line suggested file has
  two real-bodied definitions, four theorem statements and three examples.
- `lean-check`: **exit 0**, seven `sorry` warnings only. No heavy carrier is
  introduced; the matrix regression remains consistent with the corrections.
- Reader consistency, own-node acyclicity, source-issue/version validation,
  deliverable-path checks and `git diff --check`: passed.

The orchestrator should apply the five ownership proposals, reconcile the old
ET.4 aliases, secure the five missing primary proofs, and require the exact
supplier extensions before marking ET.6 closed. In particular, the strict-O
Part II must be shared with ET.6a and PEL; it must not silently become R07.3.
The existing planning handoff retains the consumer alias table. This review's
handoff records the corrected interfaces for packaging.
