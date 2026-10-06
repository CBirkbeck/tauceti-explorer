# Handoff — BP-KatoEulerSystems

Issue #766; agent Codex; session codex-Y3enmR; 6 October 2026. This completes one target-level planning pass, continuing the existing checkpoint and retaining all twenty-two inherited node IDs. It is a complete submission for independent review. All implementation statuses remain unchecked, and no stage is claimed proof-closed.

## Deliverables and verification

- [Packet](../packets/KatoEulerSystems.json): **40 nodes** — 11 constructions, 6 lemmas, 17 theorems and 6 comparisons; **49 API items, 33 unit tests, 23 planets, 12 baseline declarations, 7 gaps and 24 requests**.
- [Reader](../readmes/KatoEulerSystems.md): exact statements, hypotheses, construction/proof outlines, prerequisites, API uses, tests, source versions, corrections, supplier requests and scope boundaries. The explicit Eisenstein-product formula and piecewise smoothing exponents are recorded with the critical-value comparison.
- [Suggested signatures](../suggested/KatoEulerSystems.lean): **compiled successfully** with lean-check against the shared build’s exact Mathlib pin 082e2d37e8b0463410cdb532e111cd43d5a66174. The only warnings are declarations using admitted proofs. No language server or library build was started. More than 20 GB was available before each sequential compilation.
- The shared build’s Tau Ceti checkout is newer than f790474; the suggested file imports only individual Mathlib modules and has no Tau Ceti imports. Thus elaboration checks precisely the reused Mathlib primitives, without claiming a full two-tree pinned Tau Ceti build. The packet’s Tau Ceti baseline was checked as source, not imported by the prototype.
- python3 scripts/check_blueprint.py research/blueprint/packets/KatoEulerSystems.json: **0 errors, 0 warnings**.
- Name consistency: all 40 proposed node declaration names, all 49 API names and all 33 test labels appear in the suggested file; all node IDs and API/test names appear in the reader. Every retained inherited node ID is present. The internal dependency graph is acyclic.
- Mathematical spot checks: the weight-two/four moment sums, all Euler-factor cases, filtration interior quotient and endpoint, pushforward/pullback divisor distinction, the published period/scalar displays, and the two conjugation conventions were checked. The finite dyadic group calculation described below was reproduced. Four downloaded source digests agree with the packet.

The typed prototypes replace the inherited vacuous propositions. Missing geometric, analytic and continuous-cohomology conditions are explicitly omitted, as the protocol requires. Units, polynomials, linear maps, submodules and quotient modules are actual baseline types. Constructor realization/existence, rank-one structure and numerical control inequalities are explicit inputs or partial consequences; compilation does not prove the geometric existence, arithmetic hypotheses or full theorems. The document supplies those exact mathematical statements.

Suggested-file SHA-256 at verification: `7a3cd0a93993ba5aefde9b4fab1b714088067715a23b9805c8ea9ecaf499228e`.

## Coverage and precise continuation

| Stage | Nodes | Planets | Status |
| --- | ---: | ---: | --- |
| `KatoEulerSystems:L0` | 5 | 2 | planned |
| `KatoEulerSystems:L1` | 6 | 4 | planned |
| `KatoEulerSystems:L2` | 8 | 6 | planned |
| `KatoEulerSystems:L3` | 10 | 6 | planned |
| `KatoEulerSystems:L4` | 11 | 5 | planned |

All targets are represented by nodes, exact existing nodes, requested exports or a named gap. No stage is closed because its requests or proof-closure work remain. The seven gaps are:

1. **Big-local-field reciprocity proof closure.** The exact [KK3] generalized explicit reciprocity statement over the non-perfect-residue-field local field and its complete proof were not obtained. Kato §10 reduces 9.5 to it and the commutative comparison square 10.9.5, while §11 supplies the syntomic/Kuga–Sato comparison. Request the precise supplier above; a finite-field syntomic exponential is insufficient.
2. **All-prime CM module-structure supplier is not staged.** PAPER-BURUNGALE-TIAN-26 route 7 proposes CMAllPrimeMainConjectures, but no usable owner stage is present in the current atlas/reserved ids. Its EARLY elliptic-unit layer must export H²(V) torsion and H¹(V) free rank one at every p, including K=Q(i),p=2 and the contained-cyclotomic branch in Kato 15.14. It cannot use the Kato map or a main-conjecture equality involving that map. For the rational CM cohomological upper bound also export the elliptic-unit specialization/local-length comparison of Kato 15.13–15.17 and the required one-direction input of 15.2. H² torsion alone gives no length inequality. This packet quotes the all-prime theorem and makes its CM proof conditional; it does not install an unresolved stage id.
3. **Critical arithmetic family compatibility.** R10/L3 supplies a critical family comparison principle, but the compatible arithmetic family section, refinement normalization and specialization of Kato’s class are not furnished by Kato 16.6. Record them as a condition and gap on the comparison node. PadicFamilies:L4 consumes Kato L3/L4, so making it a prerequisite would introduce a stage cycle.
4. **General de Rham scalar and integral ordinary image exports.** The inspected R09 crystalline/vector regulator node does not give the de Rham extension of 16.4 with F⁰ containment, nor the exact integral local image used in 17.8–17.10. Their requested exports, singular Euler domains and good-period hypotheses remain proof-closure inputs.
5. **Modular strict-Selmer/H² and rank-one comparison.** Generic R07 duality sequences are present, but a complete public derivation of the modular étale-to-Galois comparison, tame character decomposition at p=2, the strict H² kernel identification and the lattice-freeness passage has not been verified. This is the exact adapter requested by the ES.8 packet, not an additional generic Euler-system theorem.
6. **Integral elliptic control and no-finite-submodule criterion.** Rubin’s III.5.17 proof cites Greenberg and a formal-group norm-freeness result, and III.5.18 sketches cancellation through ordinary control. R07 L3 and the upstream elliptic formal-group layer must export those precise statements with the local p-torsion exclusions. No direct finite-level cardinality bound is inferred from a characteristic ideal alone.
7. **Complete period normalization comparison.** The Kato 16.2 formulas were checked in the PDF; R10’s differently indexed weight, Mellin character and period bases must be compared by the exact L1 request. Equality is conditional on that dictionary, not on the two spaces both being one-dimensional.

Resolve the requested supplier exports in the packet before claiming closure. These include upstream modular moduli/norm/Picard/Weil and cusp comparisons; the two-index Hecke/transfer extension; continuous cohomology and local duality; the exact modular Iwasawa/strict-Selmer adapter; Greenberg and integral elliptic control; the differential/Gauss-sum/period dictionary and Ash–Stevens generators; the archimedean regulator; the coefficient-prime realization; the de Rham and integral ordinary regulator images; normalized additive-index Eisenstein series with weight-two regularization; analytic continuation; and the elliptic formal-group norm and finite-level Mordell–Weil inputs. The packet lists each statement and its consuming node IDs. The unstaged CM supplier is a gap, not a fabricated prerequisite ID.

The continuation should obtain those exact exports and public proof inputs, verify the early CM elliptic-unit specialization at every prime before constructing the rational map, and then refine the mathematical proof sketches to lemma level. It must keep rational and integral conclusions separate, retain critical-family compatibility as a hypothesis until supplied, and carry all local/control factors into finite-level inequalities. There is no reverse CM divisibility or BSD equality in this layer.

## Confirmed red-team findings handled

- **RT-AREA-iwasawa-1/36:** L2 directly imports ES.2’s carrier/conductor presentation/Euler-factor-change nodes. L4 directly imports ES.4 and ES.8 bounds and their hypothesis checks. All cyclotomic-unit main-conjecture prerequisites were removed from this packet. The maintainer still needs to change the atlas’s inherited ES/application stage edges, including ES.2→EulerSystemsCyclotomicMainConjecture:L0, which is outside these deliverables. This is recorded in upstreamNotes.
- **RT-AREA-iwasawa-3/2:** the moment identity has k−2 on the H_p side and target twist 2−r+(k−2)=k−r. Tests distinguish k=2,r=1 (one) from k=4,r=1 (three).
- **RT-AREA-iwasawa-3/3:** both away-from-p norm cases retain ell^(−r) in the linear term. The two nontrivial reciprocity cases retain p^(−r), the quadratic exponent remains k−1−2r, and p dividing M has factor one. T′ is not redefined.
- **RT-AREA-iwasawa-3/4:** all targets are filtration steps; interior associated graded quotients vanish. The endpoint is i≥k. The suggested interior test records both the step M and its trivial quotient, and the endpoint test uses i=k.
- **RT-AREA-iwasawa-3/5:** twist the Iwasawa representation by k−r first, specialize second, localize third and apply exp* fourth; the induced κ action is stated. The dual form, p-imprimitive value and F-rational vector remain fixed.
- **RT-AREA-iwasawa-3/6:** the inertia-invariant cokernel is identified with a Pontryagin dual of residue H¹. Original inverse corestriction corresponds to direct restriction. The residue-field cohomological-dimension argument kills the direct limit, and its dual is retained.
- **RT-AREA-iwasawa-3/7:** the theta existence argument uses divisor pushforward a_* and div(N_a f)=a_*div(f). The c=5,a=2 pullback is 25E[2]−E[10]; at a nonzero point of E[2] it has coefficient 24, whereas the original divisor has coefficient zero.

## Additional source and boundary corrections

The old supposed discrepancy between Kato 13.1 and Example 13.3 was a transcription error. The printed p.224 uses P_ell(t)=det(1−Fr_ell t:T), with arithmetic Frobenius and no inverse. The adapter now makes the dual/variable convention explicit, and the alleged discrepancy is not listed as an erratum.

Kato’s all-prime rational map, sign relation, H² torsion, H¹ rank-one freeness and nonzero-span/torsion-quotient input are distinguished. Burungale–Tian Theorem 2.4 says that the map is nonzero; it does not say every vector has nonzero image. The CM module structure is conditional on the unstaged early elliptic-unit supplier. CM cohomological divisibility additionally needs the local-length comparison of Kato 15.13–15.17 and the one-direction elliptic-unit theorem of 15.2; H² torsion alone is insufficient. The non-CM unipotent argument verifies only the rational package unless the full integral image condition holds.

Nakamura’s full-level Hecke dictionary retains its two different central powers. Its parabolic inverse-limit injectivity and Drinfeld–Manin characterization are not asserted on open-curve cohomology. The twist-one morphism uses the Γ₁ quotient, the dual form and genuine source/output twists. For its integral bound, residual absolute irreducibility, odd p and the free rank-one τ quotient remain visible.

The critical scalar comparison is conditional on the exact compatible arithmetic family section. PadicFamilies:L4 consumes Kato’s classes and cannot be used as a prerequisite for their construction. The general de Rham regulator and integral ordinary image are distinct from a generic crystalline scalar projection. Split multiplicative reduction retains its augmentation factor. The exact elliptic p-part upper bound has the nonzero L-value and all odd-prime, image, local-torsion and unit-factor exclusions.

## Sources and evidence retained for a fresh process

All source files were public. The exact URLs, editions, read sections, date and four SHA-256 digests are in the packet and reader. The scratch PDFs, text extracts, page renderings and scripts are not repository deliverables and are removed after submission.

- Kato, published Astérisque 295 (2004), Numdam PDF: §§1–2, 6.3–6.6, 8–9, 12–13, selected reduction/compatibility passages of §§7 and 10–11, §§15.12–15.17, 16.1–16.6 and the ordinary setup of §17. Page-image checks cover printed pp.124, 142–143, 163, 184, 187, 221, 224–225 and 269. The companion [KK3] big-local-field theorem and full early elliptic-unit proof/exceptional all-prime export were not obtained. Those are explicit gaps.
- Nakamura, published Inventiones Mathematicae 234 (2023), 171–290, DOI 10.1007/s00222-023-01203-7: §3.1–3.2 and Appendix A. Published page 207 was compared with Kato’s theta divisor; the Appendix A corrections were also checked. Universal deformation §4 belongs to AutomorphicCongruences, outside this packet’s constructions.
- Burungale–Tian, arXiv:2506.03465v2, 11 October 2025: Theorems 2.3–2.4, Remark 2.5 and the central/sign application. Annals 203 (2026), 1–14 publication metadata was checked. Publisher-PDF line collation was not performed, so the statement reading is explicitly scoped to v2.
- Rubin, public 1999 AWS author draft: the generic packages of Chapter II and all of Chapter III §5, pp.47–54. The issue’s Kolyvagin/Festschrift catalogue label does not turn this text into that article; neither a Festschrift-text reading nor a final-book collation is claimed.
- The actual twelve Mathlib declaration statements were read at the exact pin. Baseline vocabulary alone does not supply schemes with these arithmetic correspondences, analytic continuation, fractional q branches or continuous Galois cohomology.

Six source findings, without self-review verdicts, are recorded in sourceIssues:

1. **E1:** Kato 1.9 p.124 and the Bernoulli explanation following 3.10 omit a square in the exponent. At a/N=2/5, the correct B₂/2 is −11/300, versus the printed −23/300.
2. **E2:** Rubin’s public draft III.5.1 needs odd p for the displayed formal-logarithm lattice. For E:y²+xy=x³+1, Δ=−433 and a₁=1; evaluating its integral formal logarithm on 2u gives zero modulo 4 because the first two terms are 2u+2u² and every term of degree n≥3 has valuation at least n−v₂(n)≥2. The E₂ logarithm is 4Z₂, so the E₁ image is 4Z₂, not 2Z₂. This finding concerns the public draft, not a statement in an unread edition.
3. **E3:** Rubin’s public draft III.5.8(ii) cannot assert vanishing of H¹(GL₂(Z₂),(Q₂/Z₂)²). A reproducible finite check enumerates the 96 matrices of GL₂(Z/4), uses its natural reduction action on (F₂)², and imposes f(gh)=f(g)+g f(h). The 192 cochain coordinates have relation rank 189, cocycle dimension three and coboundary dimension two, hence H¹ dimension one. Inflation to GL₂(Z₂) is injective. The natural divisible module has zero invariants, so multiplication by two injects this class into its H¹[2]. Odd p restores the scalar-unit argument. Rational τ hypotheses at p=2 are not invalidated.
4. **E4:** Nakamura’s published p.207 theta divisor is reversed relative to Kato’s cited unit. It defines the inverse unit; inverting both entries preserves their K₂ symbol.
5. **E5:** the general-conductor smoothing in Nakamura Appendix A has d instead of d². This is the already independently confirmed extraction finding PAPER-NAKAMURA-23/E13.
6. **E6:** the two-dimensional dual representation in Nakamura Lemma A.3 must use Y₁(N_f), not full-level Y(N_f). This is the already independently confirmed extraction finding PAPER-NAKAMURA-23/E14.

The correction searches are recorded with their limited scope. E1–E4 are proposed findings for independent verification; E5–E6 cite their existing extraction review, without adding a review object here. The newly corrected smoothing exponents in the reader refer to the two cases of Kato 4.2.4; they are distinct from the Iwasawa smoothing exponents in Appendix A.
