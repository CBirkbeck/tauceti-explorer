# FIX-RT-PAPER-BROWNING-SAWIN-20

Issue [#4980](https://github.com/CBirkbeck/tauceti-explorer/issues/4980). Codex, session `codex-5ebb6f`, 30 September 2026. Base `18bd19c19a63dc415d1fe34730637080286080dc`. Claim comment 5917025621 was confirmed by bot comment 5917027887; the complete issue was reread afterwards.

The issue body lists the two medium findings, but the full verifier confirms **/1–/11 and /13** and rejects **/12**. This fixes all twelve confirmed findings with their qualifications. Only the three named deliverables change. This session previously verified the red-team report in PR #4804; the present work is a repair and requires an independent `REV-FIX`, not a fresh independent verdict by this worker.

The extraction remains complete: **157 items, 14 library, 14 planned, 129 missing**, seven routes, every missing item taken exactly once. All 149 prior IDs remain; 135 original item records are unchanged verbatim. Eight new interfaces separate library facts, imports and missing adapters. There are 46 active source findings: 45 retain recorded independent confirmation, new E47 awaits review, and duplicate E46 is archived under E35. Implementation, supplier proof closure and the sharp main-theorem gates are not claimed.

## /1 — Split the arithmetic Euler product from its topology adapters

The stable `/rev-euler-products-for-squarefree-and` ID now contains only the weighted squarefree product and its formal-factorisation/interchange adapter. New planned `/fix-all-monic-euler-product` imports **FunctionFieldArithmetic:FA.5**: identify affine-line closed points with monic irreducibles, match residue degree and polynomial degree, and remove the degree-one infinity factor from the P¹ zeta function. This supplies the all-monic series and ζ of F_q[t].

The two FF.3 packet nodes `count-of-irreducible-polynomials` and `gauss-product-formula` are named as additional arithmetic inputs; neither is falsely credited as the formal Euler-product theorem itself. The configuration route retains only its weighted formal adapters and imports FA.5. Its old “no atlas stage” claim is preserved as superseded note history, not active guidance. The infinite-product rearrangement must be justified coefficientwise.

## /2 — Name the exact Lang–Weil and dimension suppliers

`/langweil` is planned by **FF.2/lang-weil-estimate** and `/extensiondimension` by the distinct **FF.2/dimension-from-point-counts** node. Both statements now say separated finite type, matching the packet; the paper's V(G) is affine. Any nonseparated generalisation remains an adapter obligation. A one-field bound still does not detect dimension.

The existing route retains these planned source items and removes its stale missing-plan claim. The degree-uniform node is a separate contract with unresolved proof inputs. It does not automatically supply uniform families, Nisnevich or Chebotarev requirements.

**Maintainer handoff:** coordinate `PAPER-BRIGHT-NEWTON-23/87` and `PAPER-HARPAZ-WITTENBERG-16/24` with FF.2. Their respective WC.5 requests are **rejected** in the current reviews, so there are not two accepted Lang–Weil owners. This fix neither edits those papers nor lifts their review gates.

## /3 — One algebraic configuration prefix, separate topology comparison

`/configuration` explicitly constructs the diagonal-complement scheme over Z, with unit differences on ring-valued points, its squarefree/discriminant-unit polynomial quotient and constant-S_m finite étale torsor. Ordinary topology is removed from the prerequisites of that algebraic construction.

New missing `/fix-configuration-comparison` supplies the analytification identification and the equivariant configuration maps induced by a chosen homeomorphism from a disc interior to C. The quotient and covering maps must match. This does not provide a boundary-basepoint extension or braid interface. Both prefixes remain with the pending `ConfigurationSpacesAndRationalLoops` design.

**Maintainer handoff:** EVW/66 and WOOD/85 import the basic algebraic prefix while retaining their shared IG.5 genus-zero compactification and boundary work. EVW/8 imports the topological/disc comparison while retaining its boundary-basepoint and braid interfaces. The whole compactification and a disc configuration are not identified with a finite étale algebraic torsor. The EVW passages defining both models and their chosen interior homeomorphism were freshly read.

## /4 — Shared sheaf and Fourier construction, qualified by coefficients

`/schreier` names **FF.2/artin-schreier-sheaf** and `/fourierdeligne` names **FF.2/fourier-deligne-transform** and its inversion supplier. The old claims that no atlas stage constructs them are superseded. These are the overlapping finite-extension E/Q_ℓ prefixes; the current composite items retain their broader coefficient/API and precise middle-extension obligations. They are not turned into a duplicate private construction.

**Maintainer handoff:** ABE25/A19 imports the overlapping field-valued Artin–Schreier construction. Its torsion rings and local regular finite Z_ℓ-algebras require a shared generalized torsor/character and coefficient-change API at the supplier. Do not mark all A19 planned from the E-valued node. Match base change from F_p and the inverse-character convention used for geometric Frobenius. Abe retains local Fourier, product pullback and zero extension. No outside packet or paper is silently edited.

## /5–/6 — Universal monodromy and its characteristic-zero export

`/universalmonodromy` removes the added odd-characteristic restriction. The matching-hash Katz–Sarnak author PDF, **printed p.334 / PDF p.343**, states Theorem 11.4.9 on every geometric fibre over Z[1/ℓ]. Its full proof and page image were read. The theorem includes characteristic 2 when ℓ≠2. Hypersurface dimension is r−1; k≥3, r≥2 and the cubic-surface exception remain. The even-dimensional finite-monodromy exclusion uses **n(d−2)≥4**, including equality. The circle-method application still requires p>k. Subsidiary SGA7/ordinarity/Hodge calculations remain proof obligations.

Route 6 retains the pending `UniversalHypersurfaceMonodromy` owner and adds a qualified export to `MordellLawrenceVenkateshPartII`: identify the parameter space and primitive pairing, use characteristic-zero Betti/étale comparison, then deduce LV's identity-component condition. It does not assert every integral-monodromy statement or exceptional Beauville case directly from an ℓ-adic theorem. All LV application hypotheses remain local.

## /7 — Library orbits, then a missing permutation adapter

New library `/fix-frobenius-orbit-factors` credits the four actual pinned Tau Ceti declarations for the orbit-factor bijection, equality of Galois/Frobenius orbits and orbit-size/degree equality. They assume a finite base field, nonzero polynomial and algebraic splitting extension; they do **not** need squarefreeness.

New missing `/fix-frobenius-cycle-adapter` identifies the m distinct roots of a monic squarefree degree-m polynomial with Fin m and transports Frobenius to a permutation. It proves the full orbit-length multiset equals the factor-degree multiset, and the number of all cycles is ω(f). This is a proof adapter, not an already-read Tau Ceti theorem about `Equiv.Perm.cycleType`.

The native Mathlib definition and theorems were also read: `cycleType` omits fixed points (`cycleType_one` is empty, and its lengths are at least 2). The adapter therefore adds one length-1 entry per fixed point. This matters for split polynomials and the tensor/sign characters. Both `/configtrace` and `/configEuler` explicitly depend on the library input and missing adapter. Their previous finite enumeration evidence remains historical.

## /8 — Two prime choices, distinct quantifiers

New library items credit the actual Dirichlet residue-class theorem, quadratic reciprocity, the supplementary law at 2, CRT and the finite-field square criterion. Their pinned statements were read. Two **missing** early adapters are added:

- For fixed odd p>k, choose a coefficient prime ℓ above a bound with ℓ≡−1 mod p, giving order exactly 2. `/irreduciblesafe` imports this choice for its ℓ-free positive-characteristic statement.
- For fixed ℓ, choose arbitrarily large good residue characteristics p. For odd ℓ use a nonzero nonsquare a modulo ℓ and the unit CRT class p≡1 mod4, p≡a modℓ. For ℓ=2 use p≡5 mod8. Enlarge the bound beyond ℓ and all excluded bad primes. `/spread` imports this separate adapter.

These composite choices are not falsely marked library. New E47 records the implicit coefficient-prime justification in published Corollary 2.9 pp.907–908 and arXiv v3 p.14. Its search compares both versions and the latest submission history and article page; no correction was located there. It is a gap affecting nothing after the elementary choice is supplied, not a counterexample to the corollary or closure of E1–E3. It has no independent verdict yet.

## /9 — Remove the actual duplicate and qualify the witness

E35 remains active. E46 is removed from `sourceIssues`, with its whole prior record archived in `sourceIssueHistory` as a duplicate of E35. A duplicate flag in the active list would not work: the collector does not filter one.

E38's constant-solution witness now requires n≥3 and refers to E43 for n=2. Its superseded reason is retained in history. The zero projective-vector misprint and the separate nonemptiness gap remain distinct. Generated register/data files are left to the authorized intake workflow.

## /10 — Structured version provenance

Top-level `sourceVersions` records the documented historical readings on **23 September 2026** for both the published PDF and arXiv v3, with their full hashes. It does not copy the unsupported proposed preprint date of 22 September. The original source block is unchanged. Fresh matching-hash retrieval and targeted reading by codex-5ebb6f on 30 September are recorded separately under `fixSourceChecks`; no new whole-paper or whole-book reading is claimed.

## /11 — Independent early suppliers before late applications

`/polardimension` remains the ES.0 Weyl application and gains the explicit `/rev-affine-dimension-theorem-for-intersections` dependency. `/dimensionlower` uses that same generic geometry supplier. The supplier is exposed once in an independent early prefix of the pending geometric Part II.

`/polynomialbox` moves out of the undifferentiated ES.0–1 source list into a second independent early prefix of `GeometricCircleMethodAndMappingSpaces`. It imports geometry and the shared infinity-norm interface, with **no ES.0–5 or late mapping-space prerequisites**. ES.0 minor arcs and late ES.5 uniform applications consume only this prefix. The later mapping-space stages then import ES.0–1. This implements the verifier's required supplier/application split rather than adding ES.5→ES.0.

The statement and APIs retain strict |u|<q^h, q-uniform degree/ambient dependence, zero-dimensional handling and h≤0 boundary cases. BV15 Lemma 2.8 uses |u|≤q^N and q^{(N+1)e}; h=N+1 is the exact conversion. Its original projection/height-uniformity proof remains to be audited; the chosen projection must not hide dependence on coefficients or q. Zero-dimensional points are degree-bounded; for h≤0 only the zero vector can lie in the strict ball, and it contributes only if in V.

**Maintainer handoff:** give early geometry, counting and prime choices separate stages in the pending design before promotion. A whole geometric-roadmap import into ES.0 would be as inappropriate as the whole ES.5 import. The route brief states the independent prerequisites and later consumers; no fabricated stage IDs or graph data are written.

## /12 rejected; /13 current inventories

Rejected /12 is unchanged: `/infinitynorm`, `/lattice`, `/liblaurent` and the entire lattice route retain their existing pinned completion credit and remaining normalization/lattice obligations.

The JSON summary/check record and Markdown headline, route table and authoritative proof-spine count now reflect 157 items and 46 active source findings. Historical checkpoint counts are labelled historical instead of blindly replacing every earlier number. Old checks and summary are preserved as history.

## Validation and boundaries

- `scripts/check_paper.py`: pass; all 129 missing items routed once, all planned stages valid.
- Explicit `check_errata.versions_checked` and `source_issues.check_issues`: pass. Read-only errata collector: 45 confirmed, one awaiting review; E46 no longer appears actively.
- Preservation: 149 prior IDs retained, 135 original item records unchanged; original source/prerequisites preserved; E1–E45 unchanged except E38's qualified reason/history; rejected /12 and its route unchanged.
- Seven freshly retrieved primary-source/metadata hashes checked. The published PDF and arXiv-v3 hashes match the original extraction; Katz–Sarnak and BV15 match their recorded author copies. URLs, full hashes and reading scope are in `fixSourceChecks`. EVW pp.738–739 and 767–768 were read from the public Annals copy. The Annals page links no erratum; arXiv lists v3 as latest.
- Extraction dependency graph: **157 nodes, 255 edges, acyclic**.
- In-memory assembled atlas: **2,891 endpoints, 8,258 edges, acyclic**. A negative control adding whole ES.5→ES.0 is rejected as cyclic. A simulation of separate independent early geometry/counting/prime-choice stages and a late mapping-space stage remains acyclic. Test vertices are not written as atlas stages or treated as accepted plans.
- Ten finite prime witnesses check the two different quantifier patterns, including ℓ=2. They test the residue/order arithmetic, not Dirichlet infinitude.
- Exact three-file `intake.py check-files` and `git diff --check`: pass.

Historical minor-arc, Hankel, topology and Euler-product certificates are retained, not represented as freshly rerun. The sharper main-theorem gates, general topology endpoints, source subsidiary proofs, coefficient extensions and height-uniformity proof remain open as recorded. **No Lean compiled.** Independent fix review is pending.
