# Handoff: BP-SchemeKTheoryOperations (issue #987)

## Current checkpoint — 2026-09-26

Agent: **ChatGPT Pro**, session **cp-20260926-6f2c**. The bot confirmed this session's claim on #987 (claim comment 5847217142; confirmation 5847218255).

**Status: partial, handoff-only.** This continuation identifies an existing upstream owner and a mathematical gap in S.2's projective pushforward proof, supplies a counterexample to the invalid intermediate assertion, and records precise integration instructions. It does **not** modify the packet, generated document, or suggested Lean file. In particular, the erroneous proof step described below is still in the packet. Do not count this checkpoint as a completed blueprint or a completed repair.

### Preserve the preceding checkpoint

The complete cc-38267a handoff, including all stage-by-stage gaps, requests, structural proposals, source-acquisition notes and historical validation results, is preserved at this immutable revision:

https://github.com/CBirkbeck/tauceti-explorer/blob/28ed861858ba244d26285021d0761ed56384a958/research/blueprint/handoff/BP-SchemeKTheoryOperations.md

Its blob is `34ef6b4c4e43193924fb1dd08cb3d02921d8b266`. Read it together with this continuation. **Every unresolved item there remains open unless this note explicitly refines its diagnosis.** The packet's nodes, source-issue records, requests and restructuring entries have not been removed or rewritten. Historical compilation and test results in the preceding handoff belong to cc-38267a, not to this session.

Audited packet: `research/blueprint/packets/SchemeKTheoryOperations.json`, blob `03c97d130340cb7600460873b34e363603b968e3` (1,359,617 bytes). Compare against this blob before applying the edits below; another continuation may have changed the relevant nodes.

## 1. Proper coherent pushforward has an upstream owner

The old handoff calls Grothendieck's coherence theorem unowned. The actual upstream text now supplies an exact owner:

- File: `content/tau-ceti/StableReduction/README.md`.
- Layer 2: **Coherent curve theory, duality, and positivity**.
- Planet 1: **Coherent cohomology and base-change toolkit for curve families**.
- Rubric 2 states coherence of all higher direct images for a proper morphism of locally Noetherian schemes and a coherent sheaf.
- Owner reference: `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`.

Despite the layer's curve-oriented title, that rubric does **not** impose flatness or relative dimension one. Its stated generality covers the underived coherence input of `SchemeKTheoryOperations:S.2/proper-pushforward-coherent`. This is an upstream *planned theorem*, not a claim that it is implemented in the pinned library.

The reviewed library-coverage audit led to this candidate; the actual upstream README was then read. `content/tau-ceti/JacobianChallenge/README.md` was also read: its relative-cohomology Layer C is phrased for proper flat finite-presentation families and is not the right replacement for the unrestricted proper Noetherian input.

### Source-backed bridge to the existing S.2 node

[Stacks 02O5](https://stacks.math.columbia.edu/tag/02O5), Proposition 30.19.1, gives the general proper coherence theorem. Its proof reduces locally to a Noetherian base, uses coherent-sheaf devissage and Chow modification, and applies simultaneous relative Serre vanishing to a relatively ample bundle on the modification. Leray and the projective coherence theorem provide the generic-rank-one sheaf required by devissage. The projective coherence theorem is used before the general proper theorem, not circularly after it. This proof was read; its foundational ingredients should remain with the upstream owner, not be copied into S.2.

The proper-support extension is a separate bridge. [Stacks 08DS](https://stacks.math.columbia.edu/tag/08DS), Lemma 30.26.10, factors a coherent sheaf with proper support as `i_*G` for a closed immersion `i: Z -> X` with `g = f i` proper. Apply the owner's coherence theorem to `g`; higher direct images along `i` vanish, and Leray identifies the resulting direct images. The proof uses Lemma 30.26.7 for the supported-sheaf factorisation; that dependency still needs its explicit supplier when the packet is edited.

Finally [Stacks 08E2](https://stacks.math.columbia.edu/tag/08E2), Lemma 36.11.3, passes from sheaves to bounded coherent complexes by the hypercohomology spectral sequence. For the variant where `f` is merely locally of finite type and each cohomology sheaf has proper support, do **not** silently assume that `f` is quasi-compact. Apply the preceding factorisation separately to the finitely many nonzero cohomology sheaves. The finitely many proper morphisms so obtained have finite cohomological-dimension bounds; take their maximum to obtain boundedness of the spectral sequence. This avoids applying the qcqs direct-image lemma outside its hypotheses.

### Exact integration work still required

1. In `S.2/proper-pushforward-coherent`, replace the first hypothesis's unowned-coherence diagnosis by the above exact upstream import. Keep the Noetherian/proper-support hypotheses of the statement.
2. Add a request to the exact StableReduction owner for all `R^i f_*F`, with no flatness or relative-dimension restriction. Retain SF.2 requests for the distinct quasi-coherent-cohomology infrastructure.
3. Make the supported-sheaf factorisation, vanishing for closed immersions, and the bounded hypercohomology argument explicit prerequisites or owned lemmas; source them by 08DS/08E2 and the dependencies those proofs cite.
4. Refine, rather than simply delete, the existing coherence gap and the structural proposal about cohomology ownership. The underived owner is identified; packet integration, the support bridge, and graph validation remain outstanding. Do not infer that *all* coherent/cohomological infrastructure is supplied by one rubric.
5. Keep the downstream G- and K-pushforward node identifiers unchanged. Do not duplicate StableReduction's theorem or reassign its ownership from this job.

## 2. The projective perfect-pushforward proof needs a separate branch

Affected node: `SchemeKTheoryOperations:S.2/proper-perfect-pushforward-perfect`.

Its statement allows either a Noetherian target **or a projective perfect morphism over an arbitrary target**. Its first proof step invokes `S.2/proper-pushforward-coherent`, which assumes a Noetherian target. The subsequent Tor-amplitude argument does not repair the missing pseudo-coherence argument in the projective non-Noetherian case.

This is an error in the **packet proof**, not an error in Thomason–Trobaugh's theorem. Do not enter it in `sourceIssues`, and do not fix it by dropping the non-Noetherian projective case: that generality is part of the stated target and is used by the projective-bundle programme.

### Independent regression example

Let `k` be a field and let `V` be a vector space with countably infinite basis `e_0, e_1, ...`. Form the square-zero algebra `A = k direct_sum V`, with multiplication `(a,v)(b,w) = (ab, aw+bv)`. Let `f` be the identity of `Spec A` and let `E` be the two-term complex

`A -- multiplication by e_0 --> A`, in degrees -1 and 0.

The identity is projective and perfect, and `E` is strictly perfect. But `H^(-1)(E) = V`: multiplication by `e_0` kills exactly the elements with scalar component zero. The A-action on V factors through k, so any finitely generated A-submodule of V is finite-dimensional over k. Thus V is not finitely generated and this cohomology sheaf is not coherent. All elements of V are nilpotent and `A/V = k`, so `Spec A` has one point; the failure is local as well as global.

Consequently `Rf_*E = E` is perfect but does **not** have coherent cohomology. This disproves the packet's intermediate assertion in the claimed generality while satisfying, rather than contradicting, the final perfect-pushforward conclusion. Using the two-term complex avoids relying on any convention about the word coherent for a free module over a noncoherent ring.

### Source-verified route for the missing branch

Thomason–Trobaugh, [published scan](https://gwern.net/doc/math/1990-thomason.pdf), Theorem 2.5.4 (printed p. 304) and Proposition 2.7(a), Remark 2.7.2 (printed pp. 310–312), separate the two cases. The relevant pages were inspected as rendered images as well as text.

For the projective branch, work locally on the target and factor through projective space. The smooth ambient map and perfectness of the original morphism give a perfect ambient direct image. Proposition 2.7(a) descends the flat finitely presented ambient scheme and this **ambient perfect complex** to a Noetherian approximation, using 3.20. At a sufficiently late stage its cohomology has proper support, hence lies on proper infinitesimal thickenings. Noetherian coherence, the projection formula and finite cohomological dimension give a perfect pushforward there. Flat-ambient base change brings this conclusion back to the original base.

Crucial distinction: the descended ambient complex need not be a direct image of a complex on the descended closed subscheme; the relevant square need not be Tor-independent. Do not assume such a lift. The source explicitly notes that the proof of 3.20 used here does not depend on 2.7. Merely importing continuity of *K-groups* does not supply descent of perfect complexes.

### Integration and closure obligations

- Preserve the existing lemma ID and theorem statement. Split its proof into a Noetherian branch and a projective branch, beginning with target-locality of perfection.
- In the Noetherian branch, use the owner/bridge in section 1, then the projection formula and finite relative Tor-amplitude. On an affine target the proper source is quasi-compact, so the local amplitude bounds can be made uniform. Record both the pseudo-coherence and Tor-amplitude inputs.
- In the projective branch, expand the ambient-factorisation argument into named prerequisites at the protocol's granularity. In particular, separate scheme approximation, descent of ambient perfect complexes, eventual support control, and derived base change. The current request to AdicCoefficientsAndComparisons L2 for scheme approximation does not by itself supply all four.
- Check the exact existing owners of these prerequisites before adding any nodes. Do not create a dependency on the S.5 K-theoretic projective-bundle theorem in order to prove its S.2 pushforward input.
- Read the proof of 3.20 and the approximation inputs it cites before marking that branch closed; this continuation checked their role in 2.7, not every underlying proof.
- Audit at least `S.2/k-theory-proper-pushforward` and the S.5 projective-bundle/blow-up consumers after changing the prerequisites. Their IDs and generality must not be narrowed silently.

## 3. Acceptance tests to add when integrating

These are mathematical planning tests, not claims of Lean elaboration.

1. **Non-Noetherian projective success / invalid-coherence regression:** the square-zero algebra and strictly perfect two-term complex above. Perfectness must survive identity pushforward without an assertion of coherent cohomology.
2. **Projective spaces over arbitrary rings:** `P^n_A -> Spec A` and `O(m)` for arbitrary commutative A, not just Noetherian A. The projective branch must discharge the pushforward input without importing the later K-theoretic projective-bundle theorem.
3. **Proper but not perfect:** `Spec k -> Spec k[epsilon]/(epsilon^2)`. The residue field has infinite projective dimension over the dual numbers, so properness alone must not produce a K-pushforward on perfect complexes. Preserve the packet's existing negative test.
4. **Proper support without a proper or quasi-compact ambient morphism:** take the disjoint union of countably many copies of `A^1_k`, mapped to `Spec k`, and the coherent sheaf supported at the origin of one component. Its pushforward is `k[0]`. The proper-support bridge must work although the ambient map is not quasi-compact.
5. **Noetherian branch coverage:** arbitrary proper perfect morphisms over Noetherian bases must still use the coherence-plus-Tor argument; no projective embedding may be demanded of every proper morphism.

## 4. Validation and resumption

### What this session checked

- The worker instructions, issue and confirmed claim, blueprint/browser/upstream/expansion protocols, the existing handoff and the affected packet nodes.
- The relevant library-coverage ownership lead, followed by actual StableReduction and JacobianChallenge roadmap texts.
- The statements and proofs of Stacks 02O5, 08DS and 08E2, and the relevant rendered Thomason–Trobaugh pages.
- The square-zero regression by the explicit kernel and finite-generation argument above.

### What this session did not check or change

- No packet or generated-document edits were applied. The JSON still contains the diagnosed proof gap and stale unowned-coherence language.
- No new pinned Mathlib/Tau Ceti implementation claim is made. The previous session's declaration audit and compilation results have not been rerun.
- No repository validator, test suite, fresh dependency-cycle check or Lean compilation was run locally. Required pins remain Mathlib `082e2d3` and Tau Ceti `f790474`.
- Existing `sourceIssues` were not independently revalidated by this continuation. This finding concerns the packet only.

The browser connection can read the large packet through its Git blob, but the available editing action requires a complete replacement file. A safe complete reconstruction of that packet was not performed here. This handoff therefore preserves the research and exact repair instructions without pretending that an unapplied edit is an integrated result.

### Where the next worker should resume

First apply sections 1–3 to the packet while preserving all unrelated nodes, requests, sources and tests; regenerate the document from the edited packet and align the suggested Lean comments/statements where affected. Check actual declaration statements at the pinned libraries before adding infrastructure. Run `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeKTheoryOperations.json`, the index and dependency-cycle checks, relevant tests, and the suggested Lean file when the pinned environment is available. Keep the whole blueprint partial until the preceding handoff's remaining gaps are closed.

For the rest of S.1–S.7, continue from the immutable cc-38267a handoff above. In particular, preserve its tame-symbol cycle work, the move of abstract lambda-ring algebra to KTheoryLowDegrees Z.3, unresolved higher-K-theory interfaces, source-proof gaps in S.4–S.7, and the arithmetic Chow-valued Riemann–Roch ownership problem. None is resolved by this S.2 audit.
