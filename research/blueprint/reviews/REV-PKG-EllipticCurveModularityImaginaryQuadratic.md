# Independent review: imaginary quadratic modularity package

Reviewer: Codex, session `codex-ZabA9q`. Job `REV-PKG-EllipticCurveModularityImaginaryQuadratic`, issue #7482. Date: 2026-10-08. Verdict: **needs_changes**. This reviewer did not contribute to the package under review.

The README faithfully presents the accepted mathematical plan. The suggested file elaborates, but it does not yet contain the declarations required by PROTOCOL §§13 and 20. The review is complete; this verdict requests a package revision, rather than a checkpoint or a new review of the underlying plan.

## Required checks

| Requirement | Result | Evidence |
|---|---|---|
| Upstream form and density | Pass | Read UPSTREAM_GUIDE and the upstream Multiquadratic and JacobianChallenge roadmaps. The document introduces its aim, conventions and supplier boundaries, then gives eight ordered layers with targets, prerequisites, source locators, APIs and tests. README is 117,920 bytes, below 200 KB. |
| Fidelity to accepted plan | Pass after corrections | Checked all 68 targets, all 69 API entries and all 69 test entries against the accepted packet. Statements and exceptional hypotheses are retained. Stage target counts are 6, 7, 5, 11, 13, 8, 14 and 4 for IQ.1–IQ.8. Dependencies distinguish existing library carriers, earlier targets, supplier layers and their requested extensions. |
| Own words and citations | Pass | Mathematical prose is organised by this roadmap's dependency layers and applications. It contains neither source passages nor a section-by-section account of a paper. Targets have theorem/section/page locators, with fixed versions in the references; computational sources additionally have file/line locators at a fixed commit. |
| No programme process in README | Pass | No packet filenames, job identifiers, reviews, checkpoints or coverage statuses occur in the reader document. Mathematical supplier requirements are retained. |
| Suggested Lean signatures | Fail; elaboration passes | `lean-check research/blueprint/packages/EllipticCurveModularityImaginaryQuadratic/Suggested.lean` exited 0: zero errors, 115 warnings, all `declaration uses sorry`. Missing and partial signatures are detailed below. |
| Metadata | Pass | The complete file is the single line `topic = "math.NT"`. |

## Corrections applied

The genus-one Jacobian statement now specifies D₀=[0+]−[∞−], D₁=[P₁]−[∞−] and D₂=[P₂]−[∞−] over ℚ(√−3), rather than naming three unspecified classes. Their rational descent remains a mathematical assertion of the Jacobian target. The infinite-level-fifteen example now refers to `quadratic_level_fifteen_torsion`, the target that actually supplies its torsion comparison. Both corrections also appear in the suggested file's mathematical comments.

The suggested file now defines `shortEquationFamily` as a set of integral coefficient pairs using Mathlib's `NumberField.RingOfIntegers`, with membership and discriminant/ellipticity signatures. Three examples distinguish the singular pair, the discriminant −432 and two distinct coefficient pairs whose curves are related by an explicit variable change. No isomorphism quotient was substituted for the coefficient family. Its norm-height count remains unspecified in Lean.

Added the weighted quartic equation for all five `genusOneSpecialPoints` triples in characteristic zero with s²=−3. This expresses the coordinate part of the advertised API; it still does not construct their points on the smooth proper model. The comment explicitly preserves that distinction.

## Required package revision

Removing block comments before inventorying declarations gives 19 definitions, 55 API theorems, three ellipticity instances and 57 examples. The four objects below remain only prose contracts:

| Object | Missing executable interface |
|---|---|
| `Modular` | The genuine CM-or-automorphic predicate, its three APIs and three examples. |
| `symplecticTwist` | The full-level moduli construction, its three APIs and three examples. |
| `cartanCurve` | The coarse modular-curve construction, its three APIs and three examples. |
| `quarticTorsionClasses` | The Jacobian divisor-class construction, its three APIs and three examples. |

Two further APIs are comments only: `shortEquationFamily.height_count` and `quarticImaginaryPoints_j`. Thus 14 of the 69 API entries and 12 of the 69 examples have no Lean signatures.

All 43 theorem targets and both comparison targets also remain comments. In particular there is no theorem declaration for `cm_modularity`, `quadratic_modularity`, `finite_level_fifteen_modularity` or `small_imaginary_quadratic_modularity`. The comparison contracts `modularity_transport` and `nonsplit_cartan_conic` are likewise not declarations. Searching a full name inside a comment is insufficient to establish signature coverage.

Existing coordinate declarations have narrower conclusions than several full contracts: rational-function integer degree does not construct a proper j-morphism or give its geometric degree; literal coordinate triples do not construct points on the smooth curve; quartic coordinate substitutions do not construct the involution and identify its quotient. These limitations are disclosed honestly in the file, but disclosure does not supply the missing interfaces required for a complete package.

Revision must add meaningful signatures against the actual supplier carriers as they become available, preserving every stated hypothesis and geometric comparison. Do not encode the missing mathematics as arbitrary proposition parameters, phantom carriers, tautologies or axioms. The accepted plan already records the carrier and certificate dependencies; this review does not duplicate their suppliers or ask for proofs. Where a supplier is still unavailable, the unresolved signature must remain explicit and the package cannot yet receive acceptance under item 5. After revision, compare declarations after removing comments, check the mathematical content of the signatures, and rerun `lean-check`.

## Mathematical and source verification

Compared the README with the accepted packet throughout IQ.1–IQ.8, including its source versions, boundaries, prerequisites, supplier requests and acknowledged certificate requirements. No dedicated link map for this new roadmap was present in the link-map directory; the package introduces no new cross-roadmap edge. The surrounding supplier interfaces and the GL₂-type/Q-curve boundary remain as specified by the accepted plan. This review did not edit the packet or any supplier roadmap.

Fetched the six freely available PDF versions listed in the packet and the five Magma scripts at commit `e6e2e9014f55f91e1d27a23e225a5f474d2e1d81`; every download matched its recorded SHA-256. Read the relevant statements and calculations, including the following points where stronger formulations would be incorrect:

- Caraiani–Newton, arXiv:2301.10509v3, Definition 2.1.27, Theorem 5.2 and Remark 5.2.3, pp.25, 73–74; Theorem 6.1 and Corollaries 6.1.1–6.1.2, pp.87–88; §§6.2–7.2, pp.88–102. The residual restrictions, dual normalisation, auxiliary reduction types, exceptional images, finite-level-fifteen hypothesis and geometric model distinctions are retained.
- Allen–Khare–Thorne, arXiv:1910.12986v2, Theorems 7.1 and 8.1, pp.67, 71–72; Lemmas 9.1–9.8, pp.73–76; Lemma 9.11 and Propositions/Corollaries 9.12–9.16, pp.78–81. Checked the independent seed, discriminant-preserving switch, local Tate conditions, avoidance and the conditional generic witness. No circular use of the later CM endpoint is introduced.
- Zywina, §1.1, pp.1–2, Proposition 5.2, p.6, and its proof in §5.4, p.9. The density statement counts integral coefficient pairs ordered by a fixed lattice norm, and its quantitative bound concerns failure of the residual image condition; it is not a bound for an isomorphism-class ordering.
- Bruin–Flynn, §2, pp.2–4, and Box, Proposition 3.1, pp.8–9. Kept rational divisors separate from rational Jacobian points and used only the accepted weak bielliptic pullback inclusion.
- Freitas–Le Hung–Siksek, Lemmas 15.3–15.4, p.29, and Caraiani–Newton §7.2. Checked the distinct level-fifteen models and the genus-one, genus-two and quartic equations against the stated coordinate conventions and scripts. Rank, saturation, torsion and sieve completeness remain explicit certificate obligations; scripts were read, not executed.

An independent exact polynomial calculation verified both quartic involution identities (including the scalars 25 and 625 for the second quartic), both quartics' homogeneity, all four conjugate imaginary quartic points, all five weighted genus-one triples, squarefreeness and the three displayed rational roots of the sextic, and the discriminants of B, E15 and Es35. These arithmetic checks do not certify the missing geometric, Mordell–Weil or sieve statements.

Read the actual pinned Mathlib declarations supporting all fifteen baseline entries, including their ambient hypotheses. The added number-field and variable-change carriers were also read in that build. The Mathlib checkout is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared project's Tau Ceti checkout differs from the packet's Tau Ceti pin; this suggested file imports only Mathlib modules, so the successful elaboration checks its Mathlib signatures and makes no claim about unavailable Tau Ceti supplier interfaces.

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityImaginaryQuadratic.json` reports zero errors and zero warnings. JSON, metadata, size, named target/API/test coverage and whitespace checks passed. All proofs remain proposed `sorry` proofs; nothing is claimed formalised.
