# FIX-RT-PAPER-ATOBE-KONDO-YASUDA-22

Codex, session `codex-rtOQ9t`, 2 October 2026. Refs [#5526](https://github.com/CBirkbeck/tauceti-explorer/issues/5526).
Base: `dcdd993439cbdeda92efb804f8fff69b03e37991`.

Both findings in the independent verifier's `RT-PAPER-ATOBE-KONDO-YASUDA-22.review.json` are addressed, including /2, which the issue's quoted list omits. Changes are confined to this report and the extraction JSON/reader. This repair uses an existing independent RT verdict and independently checks its mathematics; it does not serve as the new independent review of its own submission.

## /1: correct the E3 rejection using the actual degenerate model

The current E3 review changes from rejected to confirmed. Its new reason identifies the correct published function, proves the counterexample, and explains both errors in the earlier review. The old review survives verbatim in `priorReviews`. The corrected verdict is attributed to **`REV-RT-PAPER-ATOBE-KONDO-YASUDA-22`**, which confirmed the RT finding, rather than falsely attributing the reversal to the original reviewer. `verification.previousChanges` retains the historical rejection, while current verification prose and the embedded reader review describe the correction explicitly.

Fresh source reading: published pp.41–42 define the groups/embedding and character; pp.46–47 define the formal family and state/prove Lemma 8.10; pp.49–50 show its use in spectral separation. The corresponding v4 family/lemma occur on pp.50–51. Published page images 1,42,47,49 were inspected. No fresh full-paper or Lapid–Mao/transitive-source audit is claimed.

### Independent calculation

At n=m=2 the primed data are G′=GL₂, L′=GL₁×GL₁, U′=N′, Ψ|N′=1 and V′=1. The normalized Whittaker factors are rank-one characters, and the Shalika transition is the identity. Thus the published formula gives, for **all** integer a,b,

\[
F_{x_1,x_2}(a,b)=q^{-(a-b)/2}x_1^a x_2^b.
\]

Iwasawa valuations are intrinsic: b is the bottom-row valuation and a+b the determinant valuation. Hence these formulas define smooth left-N′-invariant, right-K′-invariant functions. Ordinary smooth induction imposes no compact-support condition. In particular there is no generic Whittaker support wall a≥b.

With vol(K′)=1, the q upper-triangular right-coset representatives `[[ϖ,u],[0,1]]` and the representative `diag(1,ϖ)` of `K′diag(ϖ,1)K′` yield

\[
(Tf)(a,b)=qf(a+1,b)+f(a,b+1).
\]

For x≠0 set F=F_{x,x} and H=(a−b)F. The two shifts of F are q⁻¹ᐟ²xF and q¹ᐟ²xF. After their respective Hecke multiplicities, each contributes √q xF. For H their coefficients are a−b+1 and a−b−1, so

\[
TF=2\sqrt q\,xF,\qquad TH=2\sqrt q\,xH.
\]

The central operator `diag(ϖ,ϖ)` and its inverse act by x² and x⁻² on both. Together with T they generate the GL₂ spherical Hecke algebra, so the full eigencharacter agrees. But F(1)=1, H(1)=0 and H(diag(ϖ,1))=q⁻¹ᐟ²x≠0. The repeated multiset {x,x} has only one formal assignment, F; its claimed span omits H.

The boundary cancellation is explicit: H(diag(1,ϖ))=−√q x is permitted, and `qH(1,0)+H(0,1)=0`. The original review discarded precisely this allowed term. Its derivative argument also used a different family: here `F_{xe^t,xe^{-t}}=F exp(t(a−b))`, so the derivative is H, while the eigenvalues have zero derivative. Symmetry within rows of length one does not impose symmetry between the rows. The generic GL₂ Schur/Whittaker function used by the rejection is not the primed degenerate function defined on p.47.

This calculation proves the collision failure of the literal Lemma 8.10 span. It does **not** prove a general confluent-basis theorem, refute the main newform theorem, establish H∈Π, or show failure of general direct-integral separation. In particular smooth induced-model membership does not establish square-integrability or occurrence on the relevant spectral measure.

`formal-spherical`, `spherical-collision`, `spherical-span`, G4 and the Speh-integrals route retain their original statements, tests, status, dependency edges and open repair. The three items gain precise model/scope notes. E13 again records that the unrestricted Lemma 8.10 input needs a valid replacement or a justified restriction to the spectral locus being used. Its disintegration/multiplicity gap remains, and its earlier review is preserved. The unrelated main-theorem qualifications in E1/E19 are unchanged.

### Coordinate the existing literal-quotation repair

`REV-COL-ATOBE-KONDO-YASUDA-22` already found that E3.printed was an editorial paraphrase. The extraction now quotes the actual concluding fragment of the p.47 assertion, with mathematical typesetting serialized, and identifies the omitted opening eigenspace clause separately. `printedBeforeRepair` preserves the old input. The reader matches this fragment.

This is a quotation repair, not a completed collation outcome. The separate batch/result still need refreshing and independent literal comparison; neither is edited or declared complete here. No paraphrase is reclassified as absent or preprint-only.

## /2: record the source versions actually read

Top-level `sourceVersions` now copies the historical published readings of 22 September (the original checkpoint and continuation), the independent published reading of 23 September, and the targeted v4 comparisons, with their actual dates/scopes. The historical full published-PDF byte hashes are preserved as measurements of those downloads; abbreviated review hashes are not expanded into invented values. The prior layout-text hash is separately identified with its normalization and historical attribution.

Fresh bounded readings have their own 2 October entries:

| Version | Byte SHA-256 | Scope |
| --- | --- | --- |
| [Cambridge published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/div-class-title-local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field-div.pdf) | `5e767924eefd311cc092da242b51a2aa3a02cd1f9e259bd6cfe4988c5807c36e` | 878,765 bytes, 56 pages; bounded pages listed above |
| [arXiv v4](https://arxiv.org/pdf/2110.09070v4) | `32326ab828c5cfb524cfb479e337fdd9834496cd9ec39409266c281c49883a6c` | 646,605 bytes; pp.50–51 only |

Cambridge's per-download stamps make byte hashes vary. A byte hash identifies one file, while a normalized-text hash identifies text under a specified extraction/normalization. The historical reproducible `pdftotext -layout` stamp-stripped hash `c8beb4ee6815fcaff9c98e6762037519177fdd2820cddd538df98ce525fa1866` remains attributed to the prior review; that extractor was unavailable here, so no fresh reproduction of it is claimed. The v4 byte hash matches the historical file.

The [arXiv history](https://arxiv.org/abs/2110.09070) still ends at v4. Bounded exact-title correction/erratum searches found no applicable AKY correction; Crossref's [DOI record](https://api.crossref.org/works/10.1017/fmp.2022.17) has empty relation and no update-to. The publisher PDF retains the statement. A separate publisher-webpage read failed; its correction-link contents are not certified. Other findings' correction searches were not repeated. The standard provenance function now reads the explicit actual published readings as `published`.

## Maintainer synchronization outside the three-file allowance

The issue names the original review artifacts in finding /1, but its binding edit-only deliverable list includes only this report and the extraction JSON/reader. The following exact synchronization is therefore handed to the maintainer:

1. In `papers/PAPER-ATOBE-KONDO-YASUDA-22.review.json`, preserve the former notes as historical review text. Replace the E3 rejection and E13 withdrawal in the active notes with: **“E3's rejection is superseded by independently confirmed RT finding /1: the n=m=2 primed model has Ψ|N′=1 and F_{x₁,x₂}(a,b)=q^{−(a−b)/2}x₁^a x₂^b for all integers. F and H=(a−b)F have the same full spherical Hecke eigencharacter and are independent at {x,x}. The generic Whittaker wall and even Schur family do not apply. E13's spectral input needs repair with the scope stated in the corrected extraction; no general direct-integral or main-newform failure follows from this example.”** Keep the original review author/date/verdict historical; identify this as a subsequent correction, not the original reviewer's new words.
2. In `reviews/REV-PAPER-ATOBE-KONDO-YASUDA-22.md`, retain the old “The rejected mistake” section as superseded history and replace its current conclusion with the calculation above. Amend the lead's rejected count and the E13 withdrawal: the current extraction has 19 confirmed source findings. Preserve E19's main-theorem proof-gap qualification, the other 17 verdicts and source-reading evidence. The corrected embedded review already supplies the current summary.
3. Refresh E3.printed and the extraction input blob/hash in `collation/jobs/COL-ATOBE-KONDO-YASUDA-22.json`, then rerun the unresolved E3 comparison and its independent collation review against the literal published fragment. Preserve the old batch/result as provenance; do not silently turn the old paraphrase into an identical outcome.
4. Preserve independent-review attribution in generated source-issue publication. The current collector only recognizes direct extraction-review jobs: read-only collection consequently marks the newly attributed E3/E13 records awaiting review, despite the existing independent RT confirmation. During the subsequent fix review/integration, record the accepted review for these corrected source findings under a job the collector actually recognizes, or teach it to recognize the verified RT evidence. Do not publish the correction under the original reviewer's rejected verdict. No collector, queue or generated data is changed here.

The Speh-integrals and general-newform designs must continue to require a correctly proved generic/collision spanning replacement and a disintegration with domains and multiplicities. The counterexample supplies neither. Their proposals remain proposed, and no new roadmap or duplicate supplier is needed.

## Checks

- Paper validator, three-file intake and diff checks pass.
- Independent exact arithmetic in `ℚ[r]/(r²−q)` passed **13,122 assertions**, for q=2,3,4,5,7,9 and x=2/3,−3/2,1 on −5≤a,b≤5. It checks T, the central operator and its inverse, independence, and the negative-difference boundary cancellation. Thus nonsquare residue cardinalities are included. The displayed algebraic proof gives the general identity; the finite diagnostic is not a Lean proof.
- Preservation checks confirm all **161 items** (8 library, 10 planned, 143 missing), their statements/statuses, 126 API contracts, 126 planning tests, 302 acyclic dependency edges, eight routes, and seven gap IDs. Every nonlibrary item retains its exact single route. Prior E3/E13 reviews and historical verification text survive verbatim; all other finding mathematics/reviews are unchanged.

Pins stay Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No new library declaration, built/planned claim, Lean deliverable, compilation, library cache or language server is involved.
