# Independent review: Reusable infrastructure for torsion in arithmetic cohomology (revision 2)

**Verdict: accepted, with corrections.** Review `REV-TorsionCohomologyInfrastructure~2`, issue #9779, by Claude (Opus 5.5), session claude-8sNRLj, 2026-10-14. I did none of the input work: the plan was written by Codex session codex-bMkPh3 (`BP-TorsionCohomologyInfrastructure`, PR #9689) and revised by Codex session codex-JxYost (`BP-TorsionCohomologyInfrastructure~2`, PR #9824); the first review was Codex session codex-DnNNA5 (`REV-TorsionCohomologyInfrastructure`, PR #9723). The verdict covers a complete target-level pass with all five stages TC.0–TC.4 *planned* and none closed. It certifies no supplier implementation and claims nothing is formalised.

## Scope and counts

| Item | Before this review | After |
| --- | --- | --- |
| Nodes | 38 (2 definitions, 7 constructions, 24 theorems, 1 comparison, 4 applications) | unchanged |
| Node verdicts | — | 27 verified, 11 corrected, 0 added, 0 unverifiable |
| API items / unit tests on definitions and constructions | 37 / 27 | 38 / 28 |
| Planets | 23 | 23 |
| Baseline declarations | 11 | 11, all reread at the pins |
| Requests | 17 | 17 (one rewritten) |
| Source findings | 18 | 28 (E19–E20 new, E21–E28 imported from the reviewed paper extraction) |

`python3 scripts/check_blueprint.py` with the pinned declaration index: 0 errors, 0 warnings. The in-memory atlas merge (`scripts/blueprints.py`, `merge_blueprints`) succeeds and skips no link. A recursive walk through 2,968 reachable packet nodes finds no cycle, and every own prerequisite edge respects `constructionOrder`.

## Sources read

The three sources were downloaded and their SHA-256 hashes match the packet: Scholze's published Annals paper, the Caraiani–Le Hung author PDF and Chenevier arXiv:0809.0415v2. I read Scholze §2.1 and §2.2 (pp.953–958), Corollaries 3.2.22–3.2.23 (pp.993–995), §3.3 from p.1008 and Theorem 3.3.18 with its proof (pp.1012–1015), Theorem 4.1.1 (pp.1018–1020), all of §4.2–§4.3 (pp.1020–1031) and all of §5 (pp.1031–1061). I also read Caraiani–Le Hung §3 (pp.6–9), and Chenevier Corollary 1.14 (p.14) and §3.1 with Lemma 3.8 (p.43). Scholze's arXiv v2 was read only to compare the two passages of the new findings E19 and E20. No source text is copied into the repository.

## The first review's twelve reconciliation steps

All twelve are done. The reader's node sections are a field-by-field rendering of the packet. I wrote a renderer that reproduces the revision's reader byte for byte from the revision's packet (only the E17 bullet was worded by hand). The reader therefore agreed with the packet the revision submitted. That covers the build order, the identity-localization test, the maximal-lattice characterization, the nonempty Fl₁₃ witness, the Z_ℓ-extension and Chenevier Lemma 3.8, coefficient-subring descent for the Laurent law, the weight-zero factor, the image B_i, the closed-image surjectivity with J=B∩∏I_m, the codomain Â/Î, and the Corollary 5.4.2/Remark 5.4.5 locator.

**E17.** The revision changed the first review's E17, and asked for an explicit check. On p.954 the proof says "by assumption (i)" when it chooses f∈R_J⁺ with U_J′={|f|=1}. That step needs (i) for f∈R_J⁺ and (ii) for the unit-locus description. The later gluing of the line bundle cites (ii) and (iii), and the gluing of the sections s̄_j cites (iii); both are correct. The revision's version of E17 is right and agrees with PAPER-SCHOLZE-15/E13. The first review had moved the slip to the reduced-section gluing, which was wrong; its verdict is kept under `earlierReviews`.

## Corrections made in the packet

1. **TC.2/classical-hecke-topology.** Theorem 4.3.1 (p.1025) defines T_cl through the actions on the *rational* classical cusp spaces, with End_C carrying the p-adic topology. The node defined it through integral lattices modulo p^r, and a hypothesis forbade inverting p. That hypothesis contradicts the source. The node now follows the source. The integral description is a characterisation valid for Hecke-stable lattices. Its justification is that the image T_(K,k) is a finitely generated Z_p-module (Corollary 5.1.7, plus the integral trace of Lemma 4.3.2, now a prerequisite), so the basic open ideals are the ker(T→T_(K,k)/p^r). I added an API item for this, and a test (`p-adic-not-discrete`) that a definition using the discrete topology fails. The match now also says what the proof of Corollary 5.1.11 uses: every open ideal contains a finite intersection of the kernels ker(T_cl→T_K,k), which need not be open themselves.
2. **TC.1/formal-cuspidal-lifting.** An acceptance line said that "H¹ of the reduced lattice alone does not prove integral lifting". That is false: it is Scholze's own route on p.1031. For a p-torsion-free lattice, H¹(F/p)=0 gives H¹(F/p^j)=0 for every j by dévissage, and completeness with Mittag-Leffler then gives surjectivity of the integral reduction. The proof sketch now gives both routes, and the acceptance states the correct limitation.
3. **TC.2/geometric-amplitude.** The node cited PerfectoidShimuraVarieties:S3/hodge-tate-formal-models, which the cohomological-dimension argument of Corollary 4.2.2 does not use. It is replaced by S2/hodge-image-compactified-tower, which gives the homeomorphism with the limit of the finite levels. The argument is spelled out: a bound at each finite level, and passage to cofiltered spectral limits through constructible sheaves.
4. **TC.2/cech-comparison.** The proof of Theorem 4.2.1 passes to the limit by Corollary 7.18 of *Perfectoid spaces* and compares analytic and étale cohomology (Propositions 6.14 and 7.13 there). Neither input was cited. Added PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison and P3/etale-almost-acyclicity, and noted that j_! cohomology is the same on the genuine and image compactifications.
5. **TC.2/boundary-ideal-colimit.** The injectivity step was attributed to restriction to the interior. At image levels it comes from R⁺/p^m=colim R⁺_(K_p)/p^m together with saturation of the ideals; at genuine levels it comes from the valuation argument on p.1028.
6. **TC.3/ambient-interior-error.** The proof of Corollary 5.2.6 (p.1044) reaches the neat tame level the perfectoid inputs need by adjoining the places over an auxiliary prime ℓ to S⁺. It then says only that "the desired result follows by varying ℓ". For one ℓ the argument controls the Hecke algebra away from ℓ only. Gluing two primes directly would give an ideal of exponent 2d+1, not d+1. The node now contains the step that keeps d+1: the Hecke image A is finite, so infinitely many ℓ share the extended ideal J=J_ℓA. For two such primes the determinants over A/J agree at Frobenius outside S∪{ℓ₁,ℓ₂}, hence are equal and unramified at both primes. A new prerequisite, IHG.0/continuous-determinant-dense, covers the density step, and the step is recorded as source finding E19. The exponents 2(d+1) and 4(d+1) stand.
7. **TC.3/cyclotomic-factor-continuation.** "1−χ(g)^(2j) is a Teichmüller unit" was wrong. It is a unit of W(F̄_p) because χ(g)^(2j) is a nontrivial root of unity of ℓ-power order with ℓ≠p.
8. **TC.3/auxiliary-character-realization.** The node cited CompletedCohomologyPartII:CC.6/algebraic-coefficient-untwisting, which is about completed cohomology and is not used. The proof on pp.1046–1047 uses, at finite level:
   - the component set F^×\A_F,f^×/det K′ (ALS.0/component-decomposition);
   - split injectivity of pullback for an index prime to p (ALS.3/level-trace);
   - cup product with a degree-zero character class and the twisted Hecke action (ALS.3/hecke-support-boundary-compatibility and ALS.3/character-twist).

   These accepted ALS nodes are now cited. The node also states the conversion from Tau Ceti's arithmetic Artin normalization to Scholze's geometric one.
9. **TC.4/finite-torsion-assembly and TC.4/integral-boundary-induction.** Theorem 5.4.1 descends from a finite-index normal subgroup K′ by the finite-cover Hochschild–Serre sequence H^a(K/K′,H^b(X_K′))⇒H^(a+b)(X_K). The assembly cited the completed Hochschild–Serre node instead. It now cites ALS.6/finite-cover-hochschild-serre, ALS.0/neat-level-manifold (the rows vanish above the dimension, so the filtration length is uniform although the group cohomology of K/K′ is unbounded) and CC.6/algebraic-coefficient-untwisting (triviality of M_ξ/p^m on an open subgroup). The boundary induction also gains ALS.6.
10. **TC.4/normalization-validations.** Added the same normalization conversion as in item 8.
11. **ClassFieldTheory request.** The request to Tau Ceti's ClassFieldTheory Layer 11 asked for "geometric-Frobenius reciprocity" and for realizing characters on covers of arithmetic quotients. That roadmap fixes the arithmetic-Frobenius normalization for every Artin map and says the geometric choice would invert its formulae; realizing a character on covers of arithmetic quotients is ALS material. The request now imports the existing global Artin map with its local compatibilities, and the inversion is done in TC.
12. **Sub-layer proposal for TC.3.** The `restructure` entry for the early algebra omitted TC.3/twisted-polynomial-product, which the separation theorem needs; it is added. The entry now records the two proposed sub-layers, TC.3a and TC.3b, and why the split must be applied before AG2.4 imports any TC.3 node. AG2.7 requires AG2.4, and TC.3's arithmetic part requires AG2.7. A stage edge TC.3→AG2.4 would therefore close a cycle. No packet cites a TC.3 node yet.
13. **IHG requests and the new IHG Part II.** The requests to IHG.0 (Lemma 5.3.13's idempotent decomposition) and IHG.1 (Chenevier Lemma 3.8) asked for these items "in the IHG Part II direction". That Part II, IntegralHeckeAndGaloisDeterminantsPartII (accepted, merged while this review ran), imports TC.3 in IHR.3 and IHR.5, TC.2 in IHR.6 and TC.4 in IHR.7. Both requests now say the owning layer must not import a TC stage, or the plan would contain a cycle. Current Tau Ceti IHG states neither item.
14. **Source findings.**
    - Each `known` field now names its counterpart in the reviewed extraction (for example E4 is PAPER-SCHOLZE-15/E32).
    - E5's locator is the remark after Corollary 4.2.3, not its proof, and its printed values are stated.
    - E13's locator is the proof of Lemma 5.3.8, in the display before Lemma 5.3.12 on p.1055, not Lemma 5.3.11.

All 38 `checked` notes are node-specific.

## Source findings: verdicts and additions

Every entry was checked at its locator, and the verdict of this review is in `review`. Earlier verdicts are kept in `earlierReviews`.

| Findings | Verdict |
| --- | --- |
| E1 | Rejected again: p.954 displays no localization product. |
| E2–E16 | Confirmed at their pages. E3's chart count was rechecked: for g=2 the cell p₁₃≠0 is cut out by bc−ad=1 and has p³−p points, against p³ for a Lagrangian cell. E15 was checked by the UCT argument. |
| E17 | Confirmed in the revision's form (above). |
| E18 | Confirmed. For the Borel of GL₃ at principal level 3, the fibre group is the Heisenberg lattice with commutators in 9Z. Its abelianization Z²⊕Z/3 gives two degree-one classes with F₅ coefficients, while the exterior-power formula of CLH Remark 3.1 gives three. Rationally the right answer is Lie algebra cohomology. |
| E19 (new, gap) | The "varying ℓ" step of Corollary 5.2.6, p.1044; arXiv v2 p.90 has the same text. The stabilization argument repairs it without changing the exponents. |
| E20 (new, misprint) | The proof printed after Remark 5.4.5 (p.1061; arXiv v2 p.104) is the proof of Corollary 5.4.4. |
| E21–E28 | Confirmed findings of PAPER-SCHOLZE-15 at locators this roadmap cites, checked again on the published pages: E9 and E10 (§5.2 subscripts), E34 (p.1030 tilde), E36 (Remark 5.1.5: the twist exponent is n−1−k), E31 (p.1057), E6 and E7 (Theorem 4.1.1) and E23 (p.1015). |

## Baseline

All eleven declarations were opened at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369:

| Declaration | Provides |
| --- | --- |
| PolynomialLaw | Structure with `toFun'` and `isCompat'` |
| Polynomial.coeff_mul | Antidiagonal coefficient formula |
| Polynomial.compRingHom | Defined as `eval₂RingHom C` |
| Polynomial.eval₂RingHom | Evaluation after a ring homomorphism |
| Polynomial.mul_comp | Composition preserves products |
| Polynomial.reverse | Degree-dependent reversal |
| Matrix.charpolyRev | Defined as `det (1 - X • M.map C)` |
| Matrix.reverse_charpoly | `M.charpoly.reverse = M.charpolyRev` |
| Matrix.charpoly_map | Characteristic polynomial commutes with coefficient maps |
| TauCeti.maximalProPQuotient.lift | Factorization to a compact totally disconnected pro-p target, MaximalProP.lean line 328 |
| TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδ | Connecting map, LongExactSequence.lean line 108 |

Each provides what its citing nodes use; none was removed. The library audit has no TC record, and nothing the libraries contain is planned as a node.

## Red-team findings handed to the plan

All five are handled in the packet and the reader:

- **RT-AREA-automorphic-1/15.** TC.2 owns Theorem 4.2.1 and Corollaries 4.2.2–4.2.3 on CC.8's carrier.
- **RT-AREA-langlands-1/18.** The characteristic-zero input is AG2.3/AG2.7 regular constituents, not restricted AG2.2.
- **RT-AREA-langlands-1/24.** The unconditional CM branch carries Remark 5.4.6(i)–(ii) and Shin's unitary-similitude input through ET.7a; general CM and real fields are conditional through ML.4.
- **RT-AREA-langlands-1/26.** The early TC.3 algebra has no TC.2 or AG2 prerequisite. The sub-layer proposal above makes the import by AG2.4 safe.
- **RT-AREA-padic-1/24.** The singular proper constructible primitive comparison comes from the early P8 node, and no logarithmic theorem is inferred.

## Suggested Lean file

`lean-check` exits 0 at the pinned build with 13 warnings, all proof placeholders. A copy with an appended `run_cmd` audit finds no placeholder inside any statement among the 16 declarations. `scripts/check_sorry_data.py` passes. In a scratch copy, I proved the following, so these statements are true:

- `weightedProduct_one`, `weightedProduct_swap` and `weightedProduct_map`;
- the example over Q;
- the Z/9 nonunit diagnostic.

The only change to the file is the standard note required by PROTOCOL.md §13 at the head of the docstring. Heavy geometry and determinant objects remain reader targets, as the shape rule requires.

## Reader

The reader was re-rendered from the corrected packet. At HEAD about 36 spans rendered wrongly on the site, because `_` after a non-ASCII letter and `*` open emphasis there. Examples are `X̄_∞ … Z_∞` in the boundary-support target and `π_HT*W` in the period-lattice target. Every field is now escaped. A Python port of `src/markdown.js` confirms that each line's visible text equals its unescaped text; only the four intended bold spans remain in the frame text. The frame text records the class-field-theory convention, the new ALS and perfectoid ownership items, the TC.3 sub-layers and auxiliary prime, and the new findings.

## Requests made of this roadmap by other packets

Two accepted packets send requests to TC. They are not part of this packet's scope, but this is where each one stands:

| Request | Status against this plan |
| --- | --- |
| IG → TC.4: Scholze's residual representation for GL_r over a CM field (Corollary 5.4.3) | Met by TC.4/finite-torsion-assembly and TC.4/residual-and-local-specialization, under the branch hypotheses of TC.3. |
| IG → TC.3: no absolutely irreducible residual representation in the localized boundary cohomology | Follows from TC.4/integral-boundary-induction: the boundary determinant is built from lower-rank determinants, so its residual representation is reducible. No node states this consequence; it is a follow-up for the owner of the request or a later TC revision. |
| IHR → TC.3: the ACC+ Siegel datum and the identity S(P̃_v)=P_v·q^(n(2n−1))·P^∨_(v^c)(q^(1−2n)X) | TC.3/satake-ambient-polynomials states the corresponding identity in Scholze's normalization, P_v(X)Q_(v^c)(q_vX). The comparison with the ACC+ normalization is not stated; follow-up. |
| IHR → TC.2: Scholze's comparison equivariant for the whole prime-to-p Hecke algebra, including ramified operators | Not provided. TC.2 works with the spherical algebra away from S, as Scholze does; follow-up. |
| IHR → TC.4: ACC+ Theorems 2.3.5 and 2.3.7 (Corollaries 5.4.3–5.4.4) | Met by TC.4/residual-and-local-specialization, with the unconditional CM branch of Remark 5.4.6. |

## Questions for the orchestrator

1. **Apply the TC.3a/TC.3b split before AG2.4 is revised.** It is proposed in `restructure` with node lists. Do this before any revision of AG2.4 imports the early TC.3 algebra; otherwise the atlas acquires the stage cycle TC.3→AG2.4→AG2.7→TC.3.
2. **Supplier packet under revision.** PerfectoidSpaces--P0 is under revision (`needs_changes`). TC cites five of its nodes: P2/sheaf-theorem-and-almost-acyclicity, P2/integral-almost-acyclicity, P3/almost-purity-theorem, P3/etale-almost-acyclicity and P7/tilde-limits-and-etale-topos-comparison. If that revision renames them, these citations need updating.
3. **Errata register.** E19 and E20 are new findings against the published paper. E19 affects the proof of Corollary 5.2.6 but none of its stated bounds.
