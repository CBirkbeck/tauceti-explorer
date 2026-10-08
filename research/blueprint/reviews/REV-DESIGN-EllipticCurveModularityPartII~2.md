# Independent review: EllipticCurveModularityPartII, revision 2

Job `REV-DESIGN-EllipticCurveModularityPartII~2`, issue #7021. Codex, session `codex-NVGHLj`, 2026-10-08. The revision was designed by Claude, session `claude-k6AGiJ`; this session wrote neither design round nor the earlier review.

## Verdict

**Accepted after corrections, as an import index and a proposed merge.** This is a finished target-level review. It does not certify the imported mathematics as implemented or its open proof plans as closed. `EllipticCurveModularityPartII` owns no mathematical node. The accepted owner `EllipticModularityEffectiveComparisons` owns the effective comparisons, and the one unplanned Chen-isogeny input remains recorded in its gap. Maintaining a second set of definitions, proofs, APIs or planets would violate PROTOCOL §15.

The two roadmaps have the same title, parent and Bennett–Siksek route. I checked the accepted owner packet, its 100-node inventory and review, the paper route, the split decision and the actual consumers. All seven routed items name the owner. The imaginary-quadratic packet has exactly two uses of this roadmap’s EC.6, for IQ.2/symplectic-twist and IQ.4/cartan-curves, with corresponding reader lines; its compactification proposal also names this roadmap. These are precisely the references the proposed retirement must redirect. No retirement, relabeling or cross-job edit was performed.

## Inventory and corrections

The reviewed packet has **0 owned nodes, 31 target mappings, 66 imports (65 owner nodes and one R01.4 node), 2 explicit baseline citations, 6 source-decomposed layers, 0 closed layers, 0 local requests and 0 local gaps**. It has no owned API items, unit tests or planets. The owner retains its 100 nodes, nine gaps, supplier requests and three source findings. The six stages remain ordered and qualified as an index into those plans. `status: complete` describes the finished index pass; it does not establish mathematical closure.

Corrections made within the authorized deliverables:

1. Added `mathlib:Algebra.norm_eq_prod_embeddings` and `mathlib:AlgHom.card`, read at the exact pin, for the general all-embeddings norm consequence. The owner’s specialized trace-norm nodes alone do not state this general bound. The exact embedding count matters when B<1; an upper bound on the number of embeddings would not justify the comparison. Nonzero x forces B>0.
2. Specified r in the five-element set, prime p, the chosen winding quotient, K=ℚ(ζ_p)⁺, the cusp, localized smooth integral locus and Néron target in the formal-immersion mapping. Explicitly made all mixed modular curves smooth projective normalizations and fixed the involution to w_{p²}. The reader and roadmap description agree.
3. Completed the merge map: EC.2 also uses owner EC.3; EC.5 also uses owner EC.5 and R01.4. No declaration is transferred or replanned.
4. Added theorem/section/page provenance to every target mapping and refreshed the import checks. Added an owner note correcting the Darmon–Merel author-copy pagination: Lemma 8.2 begins on p.22 and Lemma 8.3 is on p.23. Corrected Lemos’s Lemma 3.2 locator is retained.
5. Corrected the claim about the suggested file’s coverage: it proves numerical threshold identities, the polynomial divisibility step, the residue-prime estimate and the finite-matrix calculation, not the elliptic-curve consequences of all the first three owner remarks. Clarified that the wild 3-adic direction has a separate design job.
6. Replaced the occurrence assertion in the ℓ=3 counterexample note with an explicit independently checked curve: y²=x(x+5)(x+32), P=(4,36), tangent slope 7 and 2P=−P. Its distinct rational roots give full rational two-torsion and P has order three.
7. Replaced the blanket supplier-coverage acceptance test with one distinguishing exact imports, baseline consequences and recorded gap routes. Preserved the previous `needs_changes` verdict in `reviewHistory`; added this review’s per-target verdicts.

No node was added, removed from the revision, or marked implemented. No baseline citation was removed. The suggested-file changes are explanatory comments only.

## Prior review and supplier boundaries

The earlier review’s blocking issue was the definitive reader’s contradictions. Its old 31-node plan has now been replaced by the import crosswalk; this is a deliberate ownership correction, not deletion of unmet mathematics. I checked every requested correction against the revised reader and the imported contracts:

- Martin uses Theorem 2 and §4. Kraus’s formulas use the square roots, correct powers and lcm. The small-prime trace transfer retains good-reduction and strict-bound steps.
- Normalized mixed curves, w_{p²}, the specified quotient and model/base conventions are explicit. Darmon–Merel establishes the original r=2,3 route; Lemos states its five-level extension. Extended winding nonvanishing is still an owner gap.
- Ideal-valued Sturm is not inferred from ordinary Sturm or R15.2. The owner’s exact integral Sturm obligation remains open. The Γ₀(4) Eisenstein construction is directed to upstream ModularForms Layer 0 in `notesForOwner`, with the weight-two corrected combinations explicitly specified there.
- R01.4 supplies finite-group theory and oddness-to-absolute-irreducibility; it does not supply rational-point, Mazur, winding or formal-model arithmetic. CN.3 alone does not certify representations for all residual primes. The owner retains the actual bad-prime, conductor, coefficient and geometry suppliers and its missing universal certificates.
- The parent R29 modularity theorem is imported; the uniform two-torsion results are not returned to the parent’s fixed-curve proof. The independent split directions are preserved as proposals/decisions, not re-reviewed mathematical plans.

Read the reviewed AUDIT-11, AUDIT-16, AUDIT-13 and relevant arithmetic-Galois coverage, and the EllipticCurves and ModularForms upstream documents, especially their native carrier, torsion, newspace, Sturm and weight-two Eisenstein conventions. No new definition duplicates audited library material. The three imported threshold definitions have equality/simplification and maximum APIs and at least three discriminating tests each; they remain at the owner. Repeating their API or planets here would create duplicate ownership.

## Target-by-target checks

The identifiers below are former target identifiers used as crosswalk keys, not owned packet nodes. Each entry’s supplier list and source locator is in `targetCoverage`, and its verdict is in `review.checked`.

| Target | Verdict | Independent check |
| --- | --- | --- |
| EC.1/krausF | verified | The real square root precedes the power 2g⁺(N); the owner uses the trivial-character Γ₁ newspace part, not its full dimension. |
| EC.1/krausG | verified | The level is lcm(N,4), and the final exponent is two. The owner’s definition and examples match. |
| EC.1/krausH | verified | The maximum retains both branches and the strict-threshold API. |
| EC.1/martin-bound | verified | Martin Theorem 2 has precisely the prime 11 modulo 12 and N=35 equality cases; its proof is §4, not §5. |
| EC.2/norm-bound | corrected | The lower bound is imported. Added the exact pinned norm-product and embedding-cardinality declarations to justify the general upper bound beyond the owner’s two specializations. |
| EC.2/removed-prime-bound | verified | Bennett–Siksek Lemma 2.2 keeps p≠ℓ, p∥M and ℓ dividing the valuation exponent. The deletion level is not silently replaced by the residual conductor. |
| EC.3/finite-rationality | verified | Kraus Lemma 1 uses coefficient recurrences, characteristic-zero Sturm equality and Galois conjugation; the owner records these prerequisites. |
| EC.3/small-prime-integrality | verified | The proof retains ℓ≥5, weight two, exact residual conductor and bounds on all coefficient conjugates; good and removed primes are separate cases. |
| EC.3/rational-newform-curve | verified | The rational newform yields exact conductor N; residual irreducibility is needed to upgrade the trace comparison to a representation isomorphism. |
| EC.3/kraus-rational | verified | Kraus Theorem 3 retains weight two, ℓ≥5 and irreducibility. Parent modularity supplies the source’s modularity hypothesis. |
| EC.4/finite-mod-four | verified | Kraus Appendix II proves the finite mod-four criterion. The imported ideal-valued Sturm obligation remains open; ordinary characteristic-zero Sturm is insufficient. |
| EC.4/small-trace-transfer | verified | Kraus §3.3 first proves good reduction at the tested primes and then exact equality of integral traces using the strict G threshold. |
| EC.4/two-isogeny-repair | verified | The degree-one-or-two repair is imported, with a finite-torsion Chebotarev step still owed by the owner. Conductor and odd-primary torsion compatibility use its elliptic suppliers. |
| EC.4/kraus-full-two | verified | Kraus Theorem 4 combines F and G, retains weight two and irreducibility, and keeps full rational two-torsion by the repair. |
| EC.4/quotient-conductor-adapter | verified | This is an application adapter, not a quoted theorem: exact deletion-conductor equality and weight two are separate conditions, including the owner’s small-ℓ reduction alternative. |
| EC.5/mazur-prime-isogenies | corrected | The prime list is Mazur’s. The non-CM restriction also imports EC.5’s CM exclusion; added that layer to the proposed merge map. |
| EC.5/two-torsion-isogeny-exclusions | verified | The composite-degree exclusions use the separate Mazur–Kenku classification node, not merely Mazur’s prime-degree theorem or finite subgroup classification. |
| EC.5/two-torsion-kernel-transport | verified | Coprime kernels give 2ℓ; a two-isogeny, its dual and the other rational two-point produce a cyclic 4ℓ kernel on an isogenous curve. No second kernel theory is planned. |
| EC.5/irreducible-full-two | verified | The source application uses ℓ≥7. Absolute irreducibility additionally imports R01.4 and elliptic oddness; R01.4 does not supply the rational-isogeny classification. |
| EC.5/irreducible-one-two | verified | The one-two-point threshold is ℓ≥11; the same separate oddness/absolute-irreducibility supplier is retained. |
| EC.6/nonsplit-potential-good | verified | Lemos Proposition 2.2 includes the place q=p and uses the local cyclotomic character there, not only unramified Frobenius at other primes. |
| EC.6/chen-correspondence | verified | The indexed correspondence, Hecke action and old-part vanishing match Lemos Lemma 3.2. Chen’s isogeny on the p-new quotient remains an external gap. Normalization and w_{p²} are explicit. |
| EC.6/rank-zero-quotient | verified | Lemos Theorem 3.4 states all five r. Darmon–Merel §7 verifies r=2,3; the owner’s extended nonvanishing input remains a gap. |
| EC.6/cuspidal-formal-immersion | corrected | Corrected the prime/r hypotheses, specified winding quotient, real cyclotomic base, cusp and smooth integral/Néron models. Author-copy Lemmas 8.2–8.3 are on pp.22–23; extension to r=5,7,13 is not independently closed. |
| EC.6/j-prime-integrality | verified | The indexed p>37 specialization is an import of the owner. The broader range of Lemos Theorem 1.4 is explicitly a note, not a new export. |
| EC.6/j-integrality | verified | The non-surjective assumption is used together with p>37 and non-CM to reach the nonsplit case. Lemos Proposition 2.1 alone assumes a nonsplit image. |
| EC.6/integral-isogeny-j-values | verified | The five numerator formulas and signed-divisor cardinalities were independently recomputed. The intrinsic j-map identification remains the owner’s recorded gap. |
| EC.6/large-proper-image | verified | Lemos Theorem 2.3 requires geometric non-CM and p>37; exceptional and split-Cartan arithmetic exclusions are separate inputs, not supplied by R01.4 alone. |
| EC.6/surjectivity-twist | verified | The imported quadratic-twist group argument has p≥5. No p=3 export is asserted or needed for Lemos’s p>37 theorem. |
| EC.6/finite-image-certificates | verified | The six non-CM j-values match the source; −2¹⁵ is excluded as CM. The claimed all-primes certificate endpoints remain planned, with universal certificate data missing explicitly. |
| EC.6/lemos-surjectivity | verified | Lemos Theorem 1.1 is restricted to geometric non-CM curves with a nontrivial rational cyclic isogeny and p>37; it is not unrestricted uniformity. |

## Baseline and source evidence

Both added declarations were confirmed in the pinned declaration index and read with their surrounding variables at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Reference | Module | Contract |
| --- | --- | --- |
| `mathlib:Algebra.norm_eq_prod_embeddings` | `Mathlib/RingTheory/Norm/Transitivity.lean`, line 268 | Finite-dimensional separable L/K and algebraically closed E/K; maps the field norm to the product over every K-algebra embedding into E. |
| `mathlib:AlgHom.card` | `Mathlib/FieldTheory/PrimitiveElement.lean`, line 360 | Finite-dimensional separable E/F and algebraically closed K/F; exactly finrank F E embeddings, not only a cardinality bound. |

Together with the imported integral-norm divisibility/comparison they justify the norm crosswalk. They do not implement ideal-norm divisibility, coefficient-field bounds or any roadmap theorem. The owner’s existing baseline inventory remains its accepted review’s responsibility; this review read the actual imported mathematical contracts rather than claiming to re-review every baseline behind its 100-node plan.

Read and checked the following public versions; all six PDF hashes match the packet. Per-target locators identify source statements separately from derived adapters; no verbatim source passage is stored.

- [Bennett–Siksek, published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf): §2, Lemmas 2.1–2.2, Theorems 3–4 and thresholds, pp.358–360; §3 irreducibility applications, pp.361–363; Lemos application §6, p.373. The radicals and exponents on printed p.360 were checked on the rendered page.
- [Kraus, published Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf): §3.1–3.3, equations (7)–(11), Lemma 1 and Theorems 3–4, pp.1142–1146; Appendix II Propositions 1–2, Corollary and proof, pp.1158–1160.
- [Martin, math/0306128v1](https://arxiv.org/pdf/math/0306128): Theorem 2, p.3; §4, Lemmas 16–22 and finite-case proof, pp.14–16. The sharp dimension bound is an arithmetic result, not simply native newspace finite-dimensionality.
- [Mazur, published scan](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf): Theorem 1, pp.129–130; introduction’s CM discussion; §7, Theorem 7.1 and proof, pp.153–155. Composite-degree classification is explicitly a different imported source obligation.
- [Lemos, arXiv:1702.01985v2](https://arxiv.org/pdf/1702.01985v2): Theorem 1.1 p.2, Theorem 1.4 p.3, Propositions 2.1–2.2 pp.4–5, proof and numerator/finite-value lists pp.5–7, §3 pp.8–10 including Lemma 3.2 and Theorems 3.3–3.4. This review does not collate the published AMS version or manufacture its missing image certificates.
- [Darmon–Merel, linked author copy](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf): §6, Theorem 6.1, Lemma 6.2 and Corollary 6.3, pp.14–16; §7, Propositions 7.1–7.2, pp.18–21; §8, Theorem 8.1 and Lemmas 8.2–8.3, pp.21–23. Its r=2,3 restriction is not silently extended.

The six original owner remarks, after adding the pagination correction, are mathematical consequences, proof alternatives, or citation/supplier observations. They do not add targets to this roadmap. In particular, residue-prime size does not by itself prove the wider winding/formal-model theorem; the owner’s proof gap remains necessary.

`sourceIssues` is empty because the three relevant mistakes are already recorded under the owner’s E1–E3. References, not duplicate errata entries, are appropriate under PROTOCOL §18:

- **E1 confirmed:** Lemos v2 p.5 incorrectly describes the Jacobian of X₀(37) as rank zero. [Elkies’s public paper](https://people.math.harvard.edu/~elkies/xisog.pdf), Appendix level 37, equation (99), printed p.41, identifies the elliptic quotient y²+y=x³−x; its rank-one discussion is on printed p.44. Independently, good reductions at 2 and 3 have 5 and 7 points. Prime-to-residue torsion injectivity at both primes forces rational torsion to be trivial, while (0,0) is a nonidentity rational point, hence nontorsion. This confirms positive rank of the Jacobian without changing the correct finite rational-point endpoint.
- **E2 confirmed:** Lemos v2 §3 p.8 says the degeneracy pullback preserves degrees. The degree-p pullback multiplies divisor degree by p; it preserves degree zero, which suffices for the Jacobian construction. The packet correctly uses the repaired construction.
- **E3 confirmed:** Bennett–Siksek equation (3), printed p.358, describes ord_q as a prime power. The deletion criterion and its intended local argument require the valuation exponent. The index uses the exponent explicitly.

The imported owner’s locator errors are planning corrections, not additional published mathematical errors. No new source error was established in this review.

## Validation and maintainer action

- `lean-check research/blueprint/suggested/EllipticCurveModularityPartII.lean` completed successfully, exit 0, with no warnings or `sorry`. It used the shared pinned Mathlib build after the memory check. No language server, build, update or cache download was started. Later suggested-file edits changed comments only.
- Pinned-index `scripts/check_blueprint.py` reports 0 errors and 0 warnings: zero owned nodes, two baseline declarations, six scopes and zero closed layers.
- Independently checked all 66 import identifiers against actual packet nodes, all 31 target suppliers against imports or the explicit baseline, coverage-stage and roadmap-requires consistency, the seven paper-route items, six source hashes and the absence of owned API/tests/planets.
- Recomputed the signed-divisor j-value sets: cardinalities 25,13,8,6,4 and constant terms 4096,729,125,49,13. Verified the explicit order-three counterexample by substitution and doubling. These arithmetic checks do not establish the intrinsic modular j-map or image certificates.
- Both JSON files parse; intake file checks and `git diff --check` pass. Only authorized deliverables and this job’s handoff change.

The maintainer still needs to apply the merge/retirement proposal. Recommended complete layer map:

| Retired layer | Surviving suppliers |
| --- | --- |
| EC.1 | owner EC.0 and EC.2 |
| EC.2 | owner EC.1 and EC.3; the two Mathlib norm citations |
| EC.3, EC.4 | owner EC.3 |
| EC.5 | owner EC.4 and EC.5; ArithmeticGaloisRepresentations R01.4 |
| EC.6 | owner EC.5 |

Preserve the owner’s nodes and gaps; redirect the two imaginary-quadratic consumer entries and their reader lines, the compactification-proposal party, and the focus/split queue metadata. The effective owner should be included in the already-decided split directions so the combined design is not regenerated. Shared Cartan compactification, integral Sturm and universal certificates remain owner closure work. No additional permission or source material is needed to finish this review.
