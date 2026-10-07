# REV-FIX-RT-AREA-automorphic-1~2

Independent review of FIX-RT-AREA-automorphic-1~2 for issue #6215. The fix is by Claude, session `claude-B2lUdi`, issue #6214, pull request #6664, merged as `df541635`.

**Reviewer.** Claude (Claude Code), session `claude-e5obk8`, 7 October 2026, at origin/main `4b6191ac`.

**Disclosure.** I wrote none of the following:
- the red team RT-AREA-automorphic-1 (`cc-39fac3`) or its verification (`codex-hjdg0j`);
- either fix round (`cc-f805bf`, `claude-B2lUdi`);
- the blueprint QSeriesPartitionsAndMockModularForms or its review;
- any MetaplecticAutomorphicForms packet.

## Verdict

**The fix of RT-AREA-automorphic-1/20 is right.** I accept it as a fix, after the corrections listed below. Seven classical Jacobi nodes of QM.1 now import the Jacobi theory of MetaplecticAutomorphicForms through one precise request to MP.6. One comparison node states the dictionary, and QM.1 constructs nothing general.

**The packet's `review` is `needs_changes`.** This verdict is about the packet as a whole, not about the fix:
- The packet's own blueprint review, REV-QSeriesPartitionsAndMockModularForms (5 October 2026), did not accept it. It left 158 nodes unverifiable, and named source collations and proof contracts that remain open.
- Its revision round, BP-QSeriesPartitionsAndMockModularForms~2 (issue #6517), carries those corrections.
- An `accepted` here would promote all 537 nodes on the strength of a review that checked eleven of them.

I follow the precedent of REV-FIX-RT-AREA-padic-2~2: accepting a narrow fix must not promote a packet whose broader review is incomplete. The preceding review object is archived verbatim in the packet's new `reviewHistory`.

**What remains of /20.** Only work that this review's deliverables cannot carry:
- synchronising the reader document with the corrections below, listed under "What remains";
- retargeting the eight MP.6 prerequisites, once the supplier's nodes state what the request asks for.

## What I reviewed

**The finding and its verdict.** The finding is RT-AREA-automorphic-1/20 (medium, duplicate: the Jacobi group and Jacobi forms have no single owner). The verifier's reason is binding:
- own the reusable Jacobi group, Schrödinger–Weil representation, coefficient, index and multiplier data, Fourier–Jacobi coefficients and theta decomposition once, with symplectic and unitary instances;
- keep MP.8's GSp(4) cover and QM.1's q-series applications;
- add no edge to AutomorphicCongruences:L2.

Only /20 concerns this packet. The other 30 findings go to the blueprint jobs that the round-2 report's table names; that routing is outside this review's files.

**The fix.** I read `RT-AREA-automorphic-1.fixes-2.md` and the round-1 section /20, and diffed the packet at `df541635^` → `df541635`:
- 8 nodes changed and 1 added;
- the new request, coverage, restructure, `ownershipContinuation`, source, `sourceIssues` E210–E212, `sourceVersions` and summary.

I also read the round's changes to the suggested file and to the reader's Jacobi sections.

**Later changes to the same file.** `c1b39075` (FIX-RT-AREA-topology~4) changed only the `uses` of eight QM.5 nodes and another restructure entry. They are outside this review and are left for REV-FIX-RT-AREA-topology~4 (#6521), which lists this packet too.

**The source.** Skoruppa, *Jacobi forms of critical weight and Weil representations*, arXiv:0707.0718v1.
- I fetched it again from <https://arxiv.org/pdf/0707.0718>. Its SHA-256 is `a4cc378e16a7dfb361e3914bbaa5e02b10567ced8802267c09fcfa4b368407a0`, the same file round 2 read.
- I read pp. 4–7 and 10–13: the notation glossary, §3 on Weil representations, and §4 through Theorem 5 and its proof.

**The supplier.** Two MetaplecticAutomorphicForms packets matter here:
- `MetaplecticAutomorphicForms--MP.0.json`, scope MP.0–MP.7: planned on 7 October 2026 (#6821) and reviewed `needs_changes` (#6829), after round 2;
- `MetaplecticAutomorphicForms--MP.8.json`.

## Finding /20, item by item

| Round-2 change | Verdict | Reason |
|---|---|---|
| Request to `MetaplecticAutomorphicForms:MP.6` | right; corrected | (a)–(e) agree with Skoruppa §4 (details below). The finding names MP.6 ("for example as nodes of MP.6"), and a sub-stage `MP.6:jacobi` is not an atlas stage, so a stage prerequisite with a request is the form PROTOCOL §3 prescribes. I made two corrections: the frame now includes Fourier–Jacobi coefficients, which the verifier's reason names, and the request now records the supplier's state as of 7 October. |
| Seven importing nodes | right | `jacobi-modular-slash`, `jacobi-elliptic-slash`, `jacobi-group-law`, `jacobi-form`, `jacobi-cusp-form`, `jacobi-theta-index` and `theta-decomposition` are Skoruppa's `φ|_{k,F}A`, `φ|_{k,F}[λ, μ]`, composition law, Definition, cusp forms, `ϑ_{F,x}` and theta expansion at `n = 1`, `F = m`. Each node gains a scope sentence, an import step and the prerequisite; formulas, API and tests are unchanged. |
| `jacobi-fourier-expansion` annotated, not imported | right | It is a lemma about every doubly periodic holomorphic function. QM.1's weak forms and QM.4's meromorphic Jacobi forms need it, and they are not Jacobi forms in the supplier's sense. |
| New comparison `jacobi-rank-one-specialisation` | right | Checked below. It has a locator for every part, its prerequisites, and no API or tests, which a comparison does not need. |
| The use by MP.8 removed from `jacobi-form` | right | The atlas has QM.1 requiring MP.8, so a use of QM.1 by MP.8 described a cycle. The MP.8 packet does not cite QM.1. |
| Titles and planets | right | "Classical Jacobi forms J_{k,m}" and "Classical theta decomposition" keep the owner's key notions from appearing twice. QM.1 still has six planets. |
| Source `skoruppa-critical-weight` and its `sourceVersions` record | right | The four excerpts are verbatim at pp. 10, 11, 11 (footnote 2) and 13. |
| E210, E211, E212 | all confirmed | Verdicts are written into the packet (below). |
| Coverage, restructure, `ownershipContinuation`, summary | right; corrected | The counts agree with the checker (537 nodes, 4 comparisons, 54 sources, 25 requests). The `remaining` item and the restructure entry are brought up to date (below). |

**The verifier's qualifications are kept.**
- No edge to L2 is proposed.
- MP.8 keeps the GSp(4) cover; the MP.8 packet requests the same MP.6 service.
- QM.1 keeps its eta, theta and q-series material: multipliers, `ϑ(z; τ)`, weak and weakly holomorphic forms, coefficient integrals, `φ_{−2,1}`, heat operators and index raising.

**Duplication.** QM.1 still writes out the classical spaces in the coordinates `(τ, z)`. I do not count this as a second owner:
- each node says it is the scalar-index case of the supplier's object and constructs nothing general;
- the classical spaces carry data the supplier's lattice-index form does not have, namely half-integral index and a character `χ` of `ℤ²`, and the comparison relates them through (c′);
- every later QM.1 and QM.4 node uses the explicit formulas;
- this is how PROTOCOL §15 asks a special case to sit beside a general theory, and how round 1 described the fix.

### The comparison node, checked

- **(a), (b).** Skoruppa p. 10 gives `(A, (λ, μ))·(A′, (λ′, μ′)) = (AA′, (λ, μ)A′ + (λ′, μ′))`. At p. 11 the action is `φ|_{k,F}A = φ(Aτ, z/(cτ + d))(cτ + d)^{−k}e(−cF[z]/(cτ + d))` and `φ|_{k,F}[λ, μ] = φ(τ, z + λτ + μ)e(τF[λ] + 2zᵗFλ)`, with `w(τ)^{−2k}` for half-integral `k`. At `n = 1`, `F = m` these are QM.1's operators.
- **(c), the multipliers.** For `(A, −w_A)`, `(−w_A)^{−2k} = (−1)^{2k}w_A^{−2k}`, so `ψ(A, ±w_A) = (±1)^{2k}v(A)`. Two further facts follow:
  - `ψ` is multiplicative exactly when `v(A₁A₂) = σ_k(A₁, A₂)v(A₁)v(A₂)`, where `w_{A₁}(A₂τ)w_{A₂}(τ) = s·w_{A₁A₂}(τ)` and `σ_k = s^{2k}`;
  - `ψ(T̃)²⁴ = 1` follows from `S̃² = (S̃T̃)³` and `S̃⁸ = 1`.
- **(c), growth implies support.** The torsion-point average at `α = −ν/2m` gives `h_ν(τ)Σ_n q^{mn²}`. Then:
  - `h_ν(τ + 1) = v(T)e(−ν²/4m)h_ν(τ)`;
  - `e(−κτ)h_ν(τ)` is `O(|q|^{−κ})` with `κ < 1`, so its singularity at `q = 0` is removable;
  - this yields `4l − r²/m ≥ 0`, which is Skoruppa's condition (ii), since `F⁻¹[r] = r²/m`.

  This argument needs the growth condition for every multiplier `v`. That is why the broken sentence of `jacobi-form` had to be repaired (below).
- **(c′).** I checked each step by hand:
  - `m(2z)² = 4mz²`;
  - `ψ|_{4m}[λ, μ] = (φ|_m[2λ, 2μ])(τ, 2z) = χ(λ, μ)²ψ`;
  - the growth conditions correspond under `α ↦ 2α`;
  - the half-lattice law is `φ|_m[l, μ] = χ(l, μ)φ` rewritten for `ψ`.
- **(d).** For `v(T) = 1` the exponents `l` are integers, and `4l − F⁻¹[r] ≥ 0` is `4nm ≥ r²`.
- **(e).** At `n = 1`, `F⁻¹[r]/4 = r²/4m`, so `ϑ_{F,x} = ϑ_{m,x}`. In W(m), `T` acts on `e_x` by `e(x²/4m)`, while `h_x(τ + 1) = e(−x²/4m)h_x(τ)` for `v = 1`, so `Σ h_x e_x` transforms by the dual. That dual is the Weil representation of `(ℤ/2m, −x²/4m)`, the discriminant module of `L(−1)`.

  Skoruppa's isomorphism is a tensor product over `ℂ[Mp₂(ℤ)]`, which for the trivial module gives coinvariants. These are the invariant vectors because the action factors locally through finite quotients: every form is fixed by a subgroup of finite index, and W(m) factors through a finite quotient. The node gives the first of these reasons, which is the essential one.

**Numerical check.** I ran my own double-precision check at `τ = 0.21 + 1.13i`, `z = 0.17 − 0.06i`, independent of round 2's. The theta identities agreed to within `10⁻¹⁴` and the operator laws to the asserted tolerance `10⁻⁹`. The checks covered:
- Skoruppa's product `ϑ(τ, z) = −i·ϑ(z; τ)`, where `ϑ(z; τ)` is Zwegers' series;
- the weight-1/2, index-2 law of `ϑ(2z; τ)` with multiplier `v_η³` on eight elements of SL(2, ℤ), including `−I` and `(3 2; 4 3)`;
- its index-2 lattice law, and the half-lattice law of (c′) with `χ(l, μ) = (−1)^{l+μ}`;
- `(U_m[X]φ)|_{k,m}A = U_m[XA](φ|_{k,m}A)` and `U_m[X′]∘U_m[X] = e(m(λμ′ − λ′μ))U_m[X + X′]`, for `m = 1/2, 0.37, 2`, real `X` and an arbitrary test function;
- the factor `−1` of the group-law boundary test at `m = 1/2`.

### Source issues

All three are confirmed at their locators in the file read; each gets `"review": {"verdict": "confirmed", …, "by": "REV-FIX-RT-AREA-automorphic-1~2"}`.
- **E210, p. 5.** The glossary prints `w_A(τ) = √(aτ + b)`. Mp(2, ℤ) is defined by `w(τ)² = cτ + d`, and `(T, w_T)` must lie in it. This is a misprint for `√(cτ + d)`.
- **E211, p. 11.** "in condition (i) of the definition, for all α": the α and the inequality are in condition (ii), which the proof of Theorem 5 cites correctly. Condition (i) also lacks its variable ("For all J_n(Γ)").
- **E212, p. 4.** `(g, z) ↦ χ(z)g` is a misprint for `χ(g)z`.

Round 2 found these only in the arXiv text. The published version (*Modular Forms on Schiermonnikoog*, CUP 2008) was not obtained here either, so the scoping stands.

## Corrections made in this review

**1. The four classical space definitions.** These are `QM.1/jacobi-form`, `QM.1/jacobi-cusp-form`, `QM.1/weak-jacobi-form` and `QM.1/weakly-holomorphic-jacobi-form`.
- The preceding review's edit (`bc1464c2`) left the sentence "For trivial multiplier and integral weight v ≡ 1 and χ : ℤ² → ℂ^× a character (χ ≡ 1 for Eichler–Zagier forms), such that …" without a subject. It can be read as imposing the growth or cusp condition only for trivial `v`.
- The version before it (`aac2a86c`) and the reader both impose the condition for every `v` and `χ`. So do the suggested `JacobiForm`, `JacobiCuspForm`, `WeakJacobiForm` and `WeaklyHolomorphicJacobiForm`, and part (c) of the comparison needs it.
- The sentence now reads "χ : ℤ² → ℂ^× is a character (v ≡ 1 for trivial multiplier and integral weight, and χ ≡ 1 for Eichler–Zagier forms); and, for every such v and χ, φ is required to satisfy: …".
- The weak and weakly holomorphic nodes are not round-2 nodes. They carry the identical defect, so they get the identical repair.

**2. The request to MP.6.**
- Its frame now lists Fourier–Jacobi coefficients with the rest of the verified boundary.
- A closing paragraph records the supplier's state. Since 7 October 2026 the MP.0 packet plans `MP.6/jacobi-group`, `MP.6/jacobi-spaces`, `MP.6/fourier-jacobi-extraction` and `MP.6/jacobi-theta-decomposition-interface`.
- These nodes are adelic and of integral central index. They do not yet state:
  - the discrete group `J_n(Γ)`;
  - the action `|_{k,F}` on `ℍ × ℂⁿ` for a matrix index;
  - the typus `(Γ, V)` and the Fourier form of the cusp condition;
  - half-integral scalar index;
  - the Heisenberg-level decomposition, or Skoruppa's Theorem 5.
- So no node of the supplier "supplies exactly the needed statement" (PROTOCOL §3), and the stage prerequisite and the request stand.

**3. QM.1's `remaining` item for /20.** Its claim that "no node of MetaplecticAutomorphicForms plans the Jacobi group or Jacobi forms" is no longer true. The item now names the four nodes, says they do not yet supply (a)–(e), and keeps the retargeting instruction.

**4. The restructure entry for QM and MP.**
- Its acyclicity claim is right for the atlas's stage graph. The edge `MP.6 → QM.1` is implied by `MP.6 → MP.7 → QM.1`.
- I checked that at round 2's base (`468b1e72`) and at its merge (`df541635`), MP.6 reached no QM stage even with the packets' induced edges.
- Since then, the MP.0 and AutomorphicSpectralTheory packets (merged 7 October, #6821 and #6860) induce stage cycles through QM.1, which the entry now records:
  - MP.7 nodes cite `QM.1/jacobi-theta-nonvanishing`, the stage QM.2 and `QM.3/weight-k-hyperbolic-laplacian`;
  - AS.0–AS.2 nodes cite the stage QM.2;
  - with QM.2 → QM.1 → MP.7, these close the cycles.
- Round 2 neither creates nor removes them.

**5. `ownershipContinuation.nodeMigration`.** It now says the migration was accepted as the fix of /20 by this review.

**6. The suggested file.**
- Round 2's comment said the whole comparison could not be stated. Part (c′), however, lies between classical spaces the file already declares.
- It is now stated as `mem_JacobiForm_iff_comp_two_mul`, with the node's hypotheses: `m ∈ ½ + ℤ`, `m > 0`, and `χ` a character with `χ² = 1`.
- Its instance is stated as `oddJacobiTheta_two_mul_mem_JacobiForm`: `ϑ(2z; τ) ∈ J_{1/2,2}(v_η³, 1)`.
- The comment now says that only the parts against the supplier's objects are left out, and why.

**7. The packet's `review` object.** It is replaced as the issue asks, with a `checked` ledger for the eleven nodes reviewed. The preceding object, with its 536-entry ledger, is moved verbatim into `reviewHistory`; that move accounts for most of the packet diff.

## Checks

- `python3 scripts/check_blueprint.py --index <pinned declarations.tsv> research/blueprint/packets/QSeriesPartitionsAndMockModularForms.json`:
  - 0 errors, 0 warnings;
  - 537 nodes, 772 API items, 514 unit tests, 42 planets, 418 baseline declarations, 22 gaps, 25 requests.
- `scripts/check_errata.py` `check()` on the packet's `sourceIssues` and `sourceVersions`: no errors.
- Lean: `lean-check` on the suggested file, in the shared build at Mathlib `082e2d37e8`. The file imports only Mathlib.
  - As received: exit 0, 1467 `declaration uses 'sorry'` warnings and no other message.
  - After the two new statements: exit 0, 1469 such warnings and no other message.
- Cycle checks: atlas stage edges plus every packet's induced edges, at `468b1e72`, `df541635` and `4b6191ac` (described in correction 4).
- The baseline citations of the nine round-2 nodes are unchanged by the fix. The checker confirms each exists in the pinned index; round 2 added none.

## What remains

**For whoever next edits the reader** (`research/blueprint/readmes/QSeriesPartitionsAndMockModularForms.md`, which is not a deliverable of this review). The revision BP-QSeriesPartitionsAndMockModularForms~2 (#6517) edits it in any case. Bring these passages into line with corrections 2–4:
- line 25 of the layer table: "its nodes for them do not exist yet";
- the request under "Requests to other roadmaps": the Fourier–Jacobi coefficients and the supplier-state paragraph;
- both copies of the QM.1 `remaining` item, near lines 1618 and 5298;
- the structural proposal for QM and MP: the cycle caveat.

The reader's definitions already impose the growth condition for every `v` and `χ`. Optionally, the comparison's paragraph can name the two new declarations.

**For the supplier.** BP-MetaplecticAutomorphicForms--MP.8 and the revision of the MP.0 packet should do two things:
- state items (a)–(e) of the request, at least for `Sp(W) = SL₂` and a lattice index;
- cite the QM.2 and QM.3 nodes they use rather than the stage QM.2, which removes the cycles through QM.2 where those nodes do not depend on QM.1.

QSeries then retargets its eight MP.6 prerequisites to the supplier's node ids.

**For the maintainer.**
1. This verdict is `needs_changes` only because the packet's own review did not accept it. Under `make_queue.py`, a `needs_changes` naming this review queues FIX-RT-AREA-automorphic-1~3. For /20 such a round has nothing to do beyond the reader synchronisation above, which BP-QSeriesPartitionsAndMockModularForms~2 also does. You may prefer to let the revision carry it.
2. The stage cycles through QM.1 recorded in correction 4 belong to the MP.0 and AutomorphicSpectralTheory packets and their reviews. Neither review mentions them: REV-MetaplecticAutomorphicForms--MP.0 checked only its internal graph.

**Not checked.** I did not check these:
- the 528 inherited nodes that round 2 did not touch, beyond the two weak-form statements repaired above;
- the open items of REV-QSeriesPartitionsAndMockModularForms;
- the published version of Skoruppa's paper.
