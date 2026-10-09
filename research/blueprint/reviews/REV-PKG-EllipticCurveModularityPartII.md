# Independent package review: effective residual comparisons

Job: `REV-PKG-EllipticCurveModularityPartII`, issue #7515. Reviewer: Codex, session `codex-0YinSk`. Date: 2026-10-09. This reviewer did not write `PKG-EllipticCurveModularityPartII`.

**Verdict: needs_changes.** The mathematical README faithfully presents the accepted import plan after the corrections below. The final suggested file elaborates successfully, but it still lacks two definition interfaces and the native signatures of most of the advertised theorem targets. This is a completed independent package review, not a checkpoint.

## The six review requirements

| Requirement | Result | Evidence |
| --- | --- | --- |
| Upstream form, structure and density | Pass | Read UPSTREAM_GUIDE and the upstream Multiquadratic and JacobianChallenge roadmaps in full. The README introduces aims, conventions and ownership, then gives six ordered layers with statements, proof/construction routes, prerequisites, source locators, APIs and discriminating examples. Its final UTF-8 size is 63059 bytes, below 200 KB. |
| Fidelity to the accepted plan | Pass after corrections | Checked all 31 target entries, the 66 imported identifiers and the two supplementary pinned Mathlib references. Layer target counts are 4, 2, 4, 5, 5 and 11. All eight displayed definitions, 27 APIs and 29 tests agree with their supplier specifications. No mathematical owner or exported range was changed. |
| Own words and precise sources | Pass after corrections | The reader is organized by mathematical dependencies and applications. It contains no source passages or section-by-section source summary. Each target gives theorem/equation, section and page locators in a specified edition. Replaced three threshold API citations with the original Kraus equations. |
| No programme process in the roadmap | Pass after corrections | Removed two references to an “indexed range.” No packet paths, job identifiers, review verdicts, checkpoints or coverage statuses appear in the README. Mathematical supplier requirements remain explicit. |
| Suggested declarations and elaboration | Fail; elaboration passes | The final `lean-check` exited 0 with zero errors and 50 warnings, all `declaration uses sorry`. Six definition interfaces, their 20 APIs and 23 labelled examples are now signatures. F/H, their seven APIs and six examples, and most native theorem targets remain absent. |
| Metadata | Pass | `metadata.toml` is exactly the single line `topic = "math.NT"`. |

## Corrections applied

The three API sections for F, G and H now cite Kraus §3.1, equation (7), p.1143, and equations (8)–(9), p.1144. Bennett–Siksek's threshold displays on p.360 drop the square roots; the README's mathematical formulas already used the correct originals. Merely pointing those API sections to the later displays obscured the source of the specified formulas.

The prose now says that the general Cartan, Chen, winding and modular-abelian inputs require the stated supplier extensions. It does not imply that the current supplier already discharges those extensions. The correspondence's old-part vanishing remains distinct from Chen's isogeny on the p-new quotient. The two integrality source notes now call their p>37 statements specializations without programme terminology.

The original suggested file contained only proved arithmetic checks, with none of the eight displayed definition interfaces. Joined the six Mathlib-expressible portions of the supplier's prototypes: `localTerms`, `martinValue`, `krausG`, `krausLocalFilters`, `lemosNumerator` and `lemosIntegralJ`. They retain the supplier's namespace `TauCeti.EffectiveEllipticComparison`, its proposed names, 20 API lemmas and 23 examples labelled by their planned test names. This is a standalone presentation of those supplier interfaces, not a transfer of ownership or a second module to import alongside an implementation. G uses the actual Mathlib congruence-subgroup index, including lcm(N,4).

Added `EllipticCurveModularityPartIIAcceptance.norm_bound` for the general two-sided estimate. Its hypotheses use Mathlib's number field, ring of integers, nonzero prime ideal, contraction to (ℓ), nonzero integral element and every complex embedding. Its conclusion is the rational field norm with exponent `Module.finrank ℚ K`; no substitute norm or freely supplied degree is used. Its proof is admitted. Preserved all existing proved arithmetic checks and the degree-one polynomial non-example. Updated the README and Lean header to describe their scope accurately.

## Remaining signature requirements

PROTOCOL §§13 and 20 and package-review item 5 require meaningful suggested declarations for the displayed definitions, APIs, tests and theorem targets. Successful elaboration of auxiliary arithmetic does not supply those interfaces. The inventory below removes comments before counting declarations: six `def`s, 20 API `lemma`s, eight public `theorem`s, one matrix abbreviation and 24 `example`s. Seven of the theorem declarations and one example retain actual proofs; the new norm theorem and the supplier prototypes use `sorry`.

Two definition interfaces remain missing: `krausF` and `krausH`. Their seven APIs and six examples are also missing. The F formula must use the actual trivial-character weight-two newspace, and Martin's bound must refer to that space. `martinValue` alone does not express its identification with a complex dimension. The proved identity `(√2+1)²=3+2√2` is not a signature for `krausF 11`.

Only G and the general norm estimate have complete target signatures among the 31 main blocks. The genus-zero block has its arithmetic polynomials, candidate sets and rational-root divisibility argument, but no identification with the actual X₀(r) j-morphism. The two-isogeny block has its matrix argument, but no elliptic isogeny, conductor or torsion comparison. The other absent native targets are listed individually below.

Revision should join meaningful supplier signatures under their existing names, or import implemented supplier declarations with their real carriers. In particular retain the actual elliptic torsion representation, exact local conductor/weight data, normalized integral newform and coefficient-field data, modular curves and Jacobians, winding quotient, integral models and universal image certificates. Comments naming a supplier do not instantiate its declarations. Arbitrary proposition parameters, conclusion-bearing fields, phantom geometric carriers and arithmetic substitutes for dimensions would not repair the omission.

The accepted input deliberately owns zero nodes and proposes merging this index into EllipticModularityEffectiveComparisons. It asserts no closed layers; its supplier records nine substantive gaps. This review does not reopen that accepted index, reject it merely for inherited gaps, demand proofs, or perform the proposed merger. The negative package verdict concerns the explicit signature requirement for the displayed roadmap targets. No packet, supplier roadmap, link map, queue or atlas data was edited.

## Target-by-target audit

Every row passes README statement, hypothesis, locator and prerequisite fidelity. The final column records the separate Lean-interface result.

| Target | Checked boundary or exceptional hypothesis | Suggested interface |
| --- | --- | --- |
| `EC.1/krausF` | Real square root; actual trivial-character newspace; exponent 2g⁺. | Missing F interface. |
| `EC.1/krausG` | Positive level; native Γ₀ index at lcm(N,4); exponent two. | Complete arithmetic signature. |
| `EC.1/krausH` | Maximum of both thresholds; strict comparisons. | Missing H interface. |
| `EC.1/martin-bound` | Positive level; equality precisely at 35 or primes 11 mod 12. | Actual newspace theorem missing. |
| `EC.2/norm-bound` | Nonzero integral element; prime above ℓ; every complex embedding. | Complete native number-field signature. |
| `EC.2/removed-prime-bound` | ℓ≥3, irreducibility, p≠ℓ, p∥M and valuation divisibility; deletion level M₀. | Geometric signature missing. |
| `EC.3/finite-rationality` | Normalized weight two, trivial character; prime tests through μ(N)/6. | Newform signature missing. |
| `EC.3/small-prime-integrality` | ℓ≥5, weight two, exact prime-to-ℓ conductor, residual isomorphism, strict F. | Newform/Galois signature missing. |
| `EC.3/rational-newform-curve` | Exact conductor, integral coefficients; irreducibility for residual isomorphism. | Elliptic realization missing. |
| `EC.3/kraus-rational` | ℓ≥5, irreducibility, Serre weight two, residual conductor N and strict F. | Geometric signature missing. |
| `EC.4/finite-mod-four` | Good odd primes; finite bound at lcm(N,4); ideal-valued mod-four input. | Point-count theorem missing; filter API present. |
| `EC.4/small-trace-transfer` | Full rational two-torsion, exact conductor, residual isomorphism and strict G. | Geometric signature missing. |
| `EC.4/two-isogeny-repair` | Every odd good prime; degree one or two; conductor and odd-primary compatibility. | Finite matrix step present; curve/isogeny theorem missing. |
| `EC.4/kraus-full-two` | ℓ≥5, irreducibility, weight two, full two-torsion and strict H. | Geometric signature missing. |
| `EC.4/quotient-conductor-adapter` | N(E[ℓ])=M₀ and weight two remain separate; small-ℓ reduction alternative retained. | Local conductor/weight adapter missing. |
| `EC.5/mazur-prime-isogenies` | Twelve prime degrees; eight non-CM degrees; geometric CM condition. | Isogeny classification missing. |
| `EC.5/two-torsion-isogeny-exclusions` | 2ℓ for ℓ≥11 and 4ℓ for ℓ≥7; separate composite classification. | Cyclic-degree exclusion missing. |
| `EC.5/two-torsion-kernel-transport` | Odd ℓ; Galois-stable kernel; dual two-isogeny for the 4ℓ construction. | Kernel transport missing. |
| `EC.5/irreducible-full-two` | Full rational two-torsion; ℓ≥7; absolute irreducibility additionally uses oddness. | Representation signature missing. |
| `EC.5/irreducible-one-two` | A nonzero rational two-point; ℓ≥11; same separate oddness input. | Representation signature missing. |
| `EC.6/nonsplit-potential-good` | p≥5; nonsplit normalizer; includes the place q=p. | Local reduction signature missing. |
| `EC.6/chen-correspondence` | Five r-levels; p outside that set; normalized mixed curves; w_(p²); away-p Hecke action. | Correspondence missing; Chen new-isogeny remains a separate input. |
| `EC.6/rank-zero-quotient` | Five r-levels; nonzero optimal quotient; finite rational points; away-p Hecke kernel stability. | Jacobian quotient signature missing. |
| `EC.6/cuspidal-formal-immersion` | Formal immersion at p>37; specified winding quotient, real cyclotomic cusp and integral/Néron models; torsion has the broader p-range. | Formal immersion and torsion signatures missing. |
| `EC.6/j-prime-integrality` | Five r-levels, p>37 and nonsplit image; conclusion ℤ[1/p]. | Geometric integrality signature missing. |
| `EC.6/j-integrality` | Geometric non-CM, five r-levels, p>37 and proper image; conclusion ℤ. | Geometric integrality signature missing. |
| `EC.6/integral-isogeny-j-values` | Actual X₀(r) coordinate; nonzero rational parameter; signed divisor of the constant term. | Polynomial API and divisibility step present; modular coordinate comparison missing. |
| `EC.6/large-proper-image` | Geometric non-CM, p>37 and proper image; exceptional and split cases have separate inputs. | Proper-image theorem missing. |
| `EC.6/surjectivity-twist` | Quadratic twists over ℚ; p≥5, with no p=3 export. | Representation comparison missing. |
| `EC.6/finite-image-certificates` | Six non-CM large-level j-values and the five integral sets; universal p>37 certificates. | Finite sets present; all-primes certificates missing. |
| `EC.6/lemos-surjectivity` | Geometric non-CM and a nontrivial rational cyclic isogeny; every prime p>37. | Surjectivity endpoint missing. |

The Chen target is the only target not literally reproduced as one string: its internal ownership parenthesis is expressed as a separate public prerequisite paragraph, preserving the mathematics. All 68 supplying identifiers occur in the README. No dedicated link map for either effective-comparison roadmap is present in `research/blueprint/links`; existing ownership and prerequisite boundaries were checked against the accepted import plan and its supplier.

## Sources and baseline evidence

Fetched the six freely available source editions cited by the accepted plan. Each PDF's SHA-256 matched its recorded hash. Read the relevant statements and proof passages, with particular attention to the following distinctions:

- **Kraus:** §3.1–3.3, pp.1142–1146, equations (7)–(9), Lemma 1 and Theorems 3–4; Appendix II §8, Propositions 1–2 and their corollary, pp.1158–1159, and §8.1's filter table, p.1160. Checked the separate good/removed-prime cases, conjugate bounds, rationality, strict thresholds, integral mod-four comparison and degree-one-or-two repair.
- **Bennett–Siksek:** §2, Theorem 3 and Lemmas 2.1–2.2, pp.358–360; §3, Lemmas 3.3 and 3.5 and their arguments, pp.361–363. Kept the deletion level M₀ distinct from the prime-to-ℓ conductor. The reusable irreducibility consequences retain separate isogeny-classification and oddness inputs.
- **Martin:** preprint Theorems 1–2 and Definitions 1A–1F, pp.2–3; §4 and Lemmas 16–22, pp.14–16. Checked the five prime-power factors, weight-two Möbius correction and exact equality alternatives for the dimension bound.
- **Mazur:** Theorem 1 and the introductory table, pp.129–131; §7, Theorem 7.1 and its proof, pp.153–155. The prime-degree classification does not provide the later composite-degree Mazur–Kenku exclusions. The README imports those separately.
- **Lemos:** arXiv:1702.01985v2, Theorems 1.1–1.4, pp.1–3; Propositions 2.1–2.2, pp.4–5; Theorem 2.3 and the five j-polynomials, p.6; finite sets, p.7; §3, Lemma 3.2 and Theorems 3.3–3.4, pp.8–10. Checked geometric non-CM, the nonsplit hypothesis, the place q=p, away-p Hecke compatibility, the p-local involution, and the separate five-level winding inputs. Finite trace samples are not all-primes surjectivity certificates.
- **Darmon–Merel:** author-copy §7, Propositions 7.1–7.2, pp.18–21; §8, Theorem 8.1 and Lemmas 8.2–8.3, pp.21–23. The original r=2,3 proof uses a nonzero winding projection, higher-dimensional rank-zero input, smooth integral/Néron models, cotangent injection and torsion specialization. The r=5,7,13 continuation remains the separately specified supplier obligation.

The bibliography distinguishes published pagination from the Martin/Lemos preprints and Darmon–Merel author copy. No restricted library book was needed; no source file or passage is included in the repository.

Read the actual pinned Mathlib statements and hypotheses of `Algebra.norm_eq_prod_embeddings` in `Mathlib/RingTheory/Norm/Transitivity.lean` and `AlgHom.card` in `Mathlib/FieldTheory/PrimitiveElement.lean`. Their finite-dimensional, separability and algebraically closed target hypotheses agree with the number-field application. The shared Mathlib checkout is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed library-coverage data has no direct entry for this import roadmap or its effective-comparison supplier; absence was not treated as proof that an API is missing.

The shared project's Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required `f790474821cf4256814db967cb154e7af3d0c369`. This file imports only Mathlib, so its successful check verifies its actual Mathlib signatures and makes no claim that the missing Tau Ceti interfaces were compiled. No language server, library build, update or cache download was started.

## Validation and limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurveModularityPartII.json`: zero errors, zero warnings; zero local nodes, APIs and tests, six planned layers, zero closed layers. Accepted input unchanged.
- `lean-check research/blueprint/packages/EllipticCurveModularityPartII/Suggested.lean`: exit 0, zero errors, 50 warnings, all admitted declarations. Available memory exceeded 20 GB before each sequential check. No compile remains running.
- Independent exact rational/integer calculations reproduced the local tests at 2², 3² and 2³; Martin values at 0, 1, 11, 30 and 35; integral/nonnegative values and the sharp bound/equality cases for levels 1–1521; Γ₀ indices at 4, 11, 16, 35 and 44; and the five monic degrees, constant terms and signed-divisor j-set sizes 25, 13, 8, 6 and 4. The explicit four-element level-13 set and the listed sample memberships agree. These finite calculations do not prove dimension, modular-coordinate or image comparisons.
- JSON, exact one-line metadata, target/API/test-name correspondence, README size, allowed paths and whitespace were checked. Source prose remains in the reader's own words. Nothing is claimed formalised.

The remaining work is a package revision supplying the missing typed interfaces. This independent review is complete.
